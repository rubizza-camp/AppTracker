namespace :db do
  desc "Add new token to database"
  task add_token: :environment do
    ARGV.each { |arg| task arg.to_sym do ; end }
    ApiToken.create(token: ARGV.last)
  end

end
