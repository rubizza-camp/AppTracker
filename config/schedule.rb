set :environment, 'development'
set :output, "/log/cron_log.log"
set :job_template, nil

every 1.minute do
  rake 'db:app:update:all'
end
