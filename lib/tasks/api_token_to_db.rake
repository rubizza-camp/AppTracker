namespace :db do
  desc 'Add new token to database'
  task add_token: :environment do
    ARGV.each { |arg| task arg.to_sym }
    ARGV.drop(1).each do |arg|
      ApiToken.create(value: arg)
    end
  end
end
