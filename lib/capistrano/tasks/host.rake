namespace :deploy do
  desc "Hostname in error page"
  task :host_error do
    on roles(:app) do |host|
      within release_path do
        puts release_path
        execute :sed, "-i", "'s/This file/This file on #{host}/g'", File.join(release_path, 'public/500.html')
      end
    end
  end

  after :finishing, 'deploy:host_error'
end

