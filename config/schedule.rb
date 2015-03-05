# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end


set :output, "log/cron_log.log"

job_type :runner, "cd :path && bundle exec rails runner -e :environment ':task' :output"
job_type :rake,   "cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"



every "*/10 * * * *" do
  runner "AlephReformattingImporter.new.import!"
end
