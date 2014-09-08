namespace :deploy do
  desc "Update last deployment time"
  task :last_deployed do
    on roles(:app) do |host|
      current_revision = within(repo_path) { strategy.fetch_revision }
      execute :echo, "date > ", File.join(release_path, "last_deploy")
    end
  end

  after :finishing, 'deploy:last_deployed'
end
