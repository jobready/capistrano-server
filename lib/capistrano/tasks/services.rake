namespace :deploy do
  [:start, :stop, :restart].each do |command|
    task command do
      on roles(:web) do
        execute :service, :puma, command, "app=#{current_path}"
      end

      on roles(:worker) do
        execute :service, :sidekiq, command, "index=0 app=#{current_path}"
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
end
