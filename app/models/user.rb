class User < ApplicationRecord
  validates :name, :image_url, :email, presence: true
  has_secure_password

  def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?gender=#{gender}&results=#{n}"
    response = HTTP.get(url)
    data = response.parse
    people = data["results"]
    people.each do |person|
      name = person["name"]["first"] + " " + person["name"]["last"]
      Rails.logger.debug "\n\n[GENERATE_USERS] name: #{name}, email: #{person['email']}"
      User.create!(
        name: name.titleize, password: person["login"]["password"],
        email: person["email"], image_url: person["picture"]["large"]
      )
    end
  end
end
