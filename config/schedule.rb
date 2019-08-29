set :output, '/log/croncron_log.log'

every 5.minutes, at: '11:53 am' do
  rake 'db:app:update:all'
end