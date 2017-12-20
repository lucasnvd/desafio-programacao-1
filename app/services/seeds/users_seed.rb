module Services::Seeds
  class UsersSeed

    def self.seed
      150.times do
        user_name = Faker::Name.name_with_middle

        next if User.exists?(name: user_name)
        User.create(
          birth_date: rand(46.years.ago.to_date..18.years.ago.to_date),
          email:      Faker::Internet.email(user_name),
          uuid:       SecureRandom.uuid,
          name:       user_name
        )
      end
    end

  end
end