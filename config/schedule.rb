set :environment, 'development'
set :output, "log/cron_log.log"

every 1.day, at: '12.00 pm' do
  rake 'db:app:update:all'
end
