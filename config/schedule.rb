require 'dotenv/load'

set :output, "#{path}/log/cron.log"


job_type :backup, "cd :path/:backup_path && :environment_variable=:environment bundle exec backup perform -t :task --config_file ./config.rb :output"

job_type :renew, "cd /home/nik/letsencrypt && echo '#{ENV['MY_PASSWORD']}' | sudo -S :task :function"

every :month do
  renew './letsencrypt-auto', function: 'renew'
end

every 1.hours do
  backup 'rails_database', backup_path: 'backup'
end

every :day, :at => '11:00 pm' do
  runner "ActiveTable.new.create_table"
end
