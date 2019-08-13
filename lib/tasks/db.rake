namespace :db do
  desc 'Add new token to database'
  task add_token: :environment do
    ARGV.each { |arg| task arg.to_sym }
    ApiToken.create(token: ARGV.last)
require './lib/services/api_data'

namespace :db do
  namespace :app do
    namespace :update do

      task all: :environment do
        Services::ApiData.update_app_all
      end

    end

    desc 'Updates specific app data (use db:app:update:all to update all apps)'
    task update: :environment do
      ARGV.each { |arg| task arg.to_sym }
      Services::ApiData.update_app(ARGV.last)
    end

  end
end
