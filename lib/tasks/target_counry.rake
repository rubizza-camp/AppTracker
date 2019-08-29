namespace :country_manager do
  desc 'Add new country to database'
  task add: :environment do
    ARGV.each { |arg| task arg.to_sym }
    ARGV.drop(1).each do |arg|
      TargetCountry.create(country_name: arg)
    end
  end

  desc 'List all target countries'
  task list: :environment do
    TargetCountry.all.each_with_index do |target_country, index|
      puts "#{index + 1}. #{target_country.country_name}"
    end
  end

  desc 'Remove target country from list'
  task remove: :environment do
    ARGV.each { |arg| task arg.to_sym }
    TargetCountry.where(country_name: ARGV.last).destroy_all
    puts "Removing #{ARGV.last} completed"
  end
end
