ssh_options[:forward_agent] = true


set :application, "proactive_technology"
set :repository,  "git@github.com:damonmaldonado/Proactive-Technologies.git"
set :rvm_ruby_string, '1.8.7'


set :scm, :git
#Old Git Version on App Server
set :scm_verbose, true
# set :git_shallow_clone, 1
# set :git_enable_submodules, 1
set :branch, "master"

set :user, "deploy"
set :password, "mpwacc3ss"

set :db_user, "proactivedb"
set :db_password, "pr0activedb1"

set :deploy_to, "~/apps/#{application}"

role :web, "184.106.134.155"                          # Your HTTP server, Apache/etc
role :app, "184.106.134.155"                          # This may be the same as your `Web` server
role :db,  "184.106.134.155", :primary => true # This is where Rails migrations will run


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

desc "Link /public/system to a directory shared by each release"
task :move_system, :roles => :app do
  run "rm #{latest_release}/public/system"
  run "ln -s #{deploy_to}/shared/system #{latest_release}/public/system"
  run "ln -s #{deploy_to}/shared/css/extra.css #{latest_release}/public/stylesheets/extra.css"
end

desc "Make tmp and log dir"
task :make_tmp_dirs, :roles => :app do
  run "rm -Rf #{latest_release}/tmp"
  run "rm -Rf #{latest_release}/log"
  run "mkdir #{latest_release}/tmp"
  run "mkdir #{latest_release}/log"
end

before "deploy:restart", :make_tmp_dirs
before "deploy:restart", :move_system