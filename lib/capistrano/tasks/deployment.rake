namespace :deploy do
  desc "Update last deployment time"
  task :last_deployed do
    on roles(:app) do |host|
      current_revision = fetch_revision
      execute :echo, "#{current_revision} > ", File.join(release_path, "last_deploy")
    end
  end

  after :finishing, 'deploy:last_deployed'
end