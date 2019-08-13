namespace :db do
  desc "Add new token to database"
  task add_token: :environment, [:option] do |task, args|
    ApiToken.create(token: args)
  end

end
