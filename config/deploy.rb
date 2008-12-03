set :application, "graphic_surf"
set :user, "surfer"
set :repository,  "git@github.com:learc83/graphic_surf.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

set :port, 31000

set :deploy_to, "/home/surfer/public_html/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, "git"
set :deploy_via, :remote_cache

set :location, "graphicsurf.com"

role :app, location
role :web, location
role :db,  location, :primary => true