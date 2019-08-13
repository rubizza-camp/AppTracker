require './lib/services/target_apps'

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
