namespace :users do
  desc "Update all users with Clearbit API enrichment"
  task update_all: :environment do
    users = User.all
    puts "Updating #{users.count} users"
    users.each do |user|
      UpdateUserJob.perform_later(user.id) #task is calling a job, which means it will be done before the job and we can lauch new task immediatly
    end
    puts 'Done'
  end

  desc "Update one given user with Clearbit API enrichment"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Updating #{user.email}"
    UpdateUserJob.perform_later(user.id)
    puts 'Done'
  end
end
