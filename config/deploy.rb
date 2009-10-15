set :application, "listoff"

set :scm, :git
set :repository,  "git@github.com:bensie/listoff.git"
set :branch, "master"

set :deploy_to, "/home/jkmiller/apps/#{application}-production"
set :deploy_via, :remote_cache

set :use_sudo, false

set :user, "jkmiller"
set :runner, "jkmiller"

role :app, "amsterdam.jkmillertech.com"
role :web, "amsterdam.jkmillertech.com"
role :db,  "amsterdam.jkmillertech.com", :primary => true

namespace :deploy do
  desc 'Restarting the application'
  task :restart do
    puts 'Restarting the application'
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
  
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
  #  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  #  run "ln -nfs #{shared_path}/config/app_config.yml #{release_path}/config/app_config.yml"
  end
  
end

after 'deploy:update_code', 'deploy:symlink_shared'
