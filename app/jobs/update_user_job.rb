class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id) #use very simple objects (string, int, array, hash) as arguments -> user_id instead of user
    user = User.find(user_id) #finding user from id instead of using user as arg
    # Call API
    puts ' Working hard, calling Clearbit API'
    sleep 4
    # Update user
    puts 'User updated!'
  end
end
