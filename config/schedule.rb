set :output, '/log/croncron_log.log'

every 1.days, at: '10:00 am' do
  rake 'db:app:update:all'
end