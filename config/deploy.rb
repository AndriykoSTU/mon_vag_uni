# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'myapp'



set :scm, :git
set :repo_url, 'https://AndriykoSTU:deusexmach1na@github.com/AndriykoSTU/mon_vag_uni'
set :branch, 'master'


#set :use_sudo, false
#set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('config/mongoid.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets','vendor/bundle', 'public/system')




after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end


namespace :mongoid do
  desc "Copy mongoid config"
  task :copy do
  	on roles(:all) do
  	   execute "mkdir -p #{shared_path}/config"
  	   #execute "touch #{shared_path}/config/mongoid.yml"
end
  	run_locally do |cop|
    execute "scp config/mongoid.yml deployer@192.168.44.10:/#{shared_path}/config/"
  end
end
end

before "deploy:starting", "mongoid:copy"
