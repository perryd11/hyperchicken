require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_ruby_string, "ruby-2.1.0@hyperchicken"

# set :application, "hyperchicken"
set :deploy_to, "/home/hyperchicken"

set :scm, :git
set :repository,  "git@github.com:jonesdeini/hyperchicken.git"
set :branch, "master"

set :user, "hyperchicken"
set :use_sudo, false

set :location, "184.73.157.166"
role :web, location
role :app, location
# role :db,  location, :primary => true # This is where Rails migrations will run

ssh_options[:forward_agent] = true

namespace :configs do
  task :symlink do
    run "cp -R ~/shared/config/* #{release_path}/config/"
  end
end

before "deploy:setup", "rvm:install_ruby"

# before "deploy:finalize_update", "configs:symlink"

after "deploy:restart", "deploy:cleanup"
