require './lib/services/target_apps'

namespace :target_apps do
  desc 'List all target apps'
  task list: :environment do
    Services::TargetApps.list
  end

  desc 'Adding new target app to list'
  task add: :environment do
    ARGV.each { |a| task a.to_sym }
    Services::TargetApps.add ARGV.last
  end

  desc 'Remove target app from list'
  task remove: :environment do
    ARGV.each { |a| task a.to_sym }
    Services::TargetApps.remove ARGV.last
  end
end
