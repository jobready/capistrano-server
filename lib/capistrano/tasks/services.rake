namespace :deploy do
  [:start, :stop, :restart].each do |command|
    desc "Run #{command} on servers"
    task command do
      on roles(:web) do
        sudo :service, 'puma-manager', command
      end

      on roles(:worker) do
        sudo :service, 'sidekiq-manager', command
      end
    end

    namespace :nginx do
      task command do
        on roles(:web) do
          execute :service, :nginx, command
        end
      end
    end
  end

  after 'deploy:finished', 'deploy:restart'
end
