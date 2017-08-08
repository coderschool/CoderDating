namespace :coderdating do
  desc "Create five female users and five male users"
  task generate_users: :environment do
    fem_url = 'https://randomuser.me/api?results=5&gender=female'
    male_url = 'https://randomuser.me/api?results=5&gender=male'
    [fem_url, male_url].each do |url|
      HTTP.get(url).parse['results'].each do |person|
        User.create!(
          name: "#{person['name']['first']} #{person['name']['last']}",
          email: "#{person['email']}",
          image_url: "#{person['picture']['large']}",
          password: "#{person['login']['password']}"
        )
      end
    end

    puts "Generated #{User.count} users!"
  end
end
