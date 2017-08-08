namespace :coderdating do
  desc "Create five female users and five male users"
  task generate_users: :environment do
    old_count = User.count 
    User.generate_users(5, "male")
    User.generate_users(5, "female")
    puts "Generated users. Was #{old_count}, now #{User.count} users!"
  end
end
