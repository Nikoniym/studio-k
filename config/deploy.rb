# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "deploy"
set :repo_url, "git@github.com:Nikoniym/studio-k.git"

set :stage, :production
set :git_enable_submodules, 1
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/nik/deploy"
set :deploy_user, 'nik'
set :console_env, :production
set :console_user, 'nik'
set :logtail_files, %w( /var/log/syslog )
set :logtail_lines, 50
# set :linked_file, %w{config/database.yml .env}
# set :inked_dir, %w{bin log tmp/pids tmp/cache tmp/sockets public/system vendor/bundle}
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", ".env"

# Default value for linked_dirs is []
append :linked_dirs,  "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor/bundle", "public/uploads"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5
namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:all), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end

namespace :logs do
  namespace :tail do
    desc 'Tail sidekiq log'
    task :sidekiq do
      on roles(:app) do
        logtail_utility.tail(release_path.join('log', 'sidekiq.log'))
      end
    end
  end
end