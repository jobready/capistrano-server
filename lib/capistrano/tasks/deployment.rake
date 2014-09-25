namespace :deploy do
  desc "Update last deployment time"
  task :last_deployed do
    deployment = DateTime.now
    on roles(:app) do |host|
      execute :echo, "#{deployment} > ", File.join(release_path, "last_deploy")
    end
  end

  after :finished, 'deploy:last_deployed'
end
