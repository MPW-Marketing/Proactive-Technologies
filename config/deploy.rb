ssh_options[:forward_agent] = true
set :application, "Proactive Homepage"
set :repository,  "git@github.com:M4N14C/Proactive-Technologies.git"

set :scm, :git
#Old Git Version on App Server
set :scm_verbose, true
# set :git_shallow_clone, 1
# set :git_enable_submodules, 1
set :branch, "master"

set :user, "craigmpw"
set :password, "tpqf58a1"

set :deploy_to, "/home/craigmpw/apps/#{application}"

role :web, "proactive.mpwstaging.com"                          # Your HTTP server, Apache/etc
role :app, "proactive.mpwstaging.com"                          # This may be the same as your `Web` server
role :db,  "mysql.mpwstaging.com", :primary => true # This is where Rails migrations will run


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end