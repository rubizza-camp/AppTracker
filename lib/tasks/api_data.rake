namespace :db do
  namespace :app do
    namespace :update do
      task all: :environment do
        App.find_each do |current_app|
          Services::UpdateManager.call(current_app: current_app)
        end
      end
    end

    desc 'Updates specific app data (use db:app:update:all to update all apps)'
    task update: :environment do
      ARGV.each { |arg| task arg.to_sym }
      unless App.find_by(title: ARGV.last)
        Services::UpdateManager.call(Services::UpdateManager.update_meta(ARGV.last))
      else
        Services::UpdateManager.call(current_app: App.find_by(title: ARGV.last))
      end
    end
  end
end
