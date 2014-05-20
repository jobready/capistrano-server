namespace :deploy do
  task :key do
    key = ''
    run_locally do
      name = ENV['SSH_KEY'] || '~/.ssh/id_rsa.pub'
      key = capture :cat, name
    end
    on roles(:all) do
      execute :echo, key, '>>', '/root/.ssh/authorized_keys' unless key.empty?
    end
  end
end
