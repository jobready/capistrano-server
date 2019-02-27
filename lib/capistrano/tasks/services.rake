namespace :deploy do
  [:start, :stop, :restart].each do |command|
    desc "Run #{command} on servers"
    task command do
      on roles(:web) do
        case fetch(:init_system, :upstart)
        when :upstart
          sudo :service, 'puma-manager', command
        when :systemd
          sudo :systemctl, command, 'puma'
        end
      end

      on roles(:worker) do
        case fetch(:init_system, :upstart)
        when :upstart
          sudo :service, 'sidekiq-manager', command
        when :systemd
          sudo :systemctl, command, 'sidekiq'
        end
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
