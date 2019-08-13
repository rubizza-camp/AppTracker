require './lib/services/target_apps'

namespace :target_apps do
  desc 'list all target apps'
  task list: :environment do
    Service::TargetApps.list
  end

  desc 'adding new target app to list'
  task add: :environment do
    ARGV.each { |a| task a.to_sym }
    Service::TargetApps.add ARGV.last
  end

  desc 'remove target app from list'
  task remove: :environment do
    ARGV.each { |a| task a.to_sym }
    Service::TargetApps.remove ARGV.last
  end
end
