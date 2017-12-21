module Services::Seeds
  class UsersSeed

    def self.call
      new.call
    end

    def call
      create_default_user!

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

    private

    def create_default_user!
      User.create(
        birth_date: 21.years.ago.to_date,
        email:      'teste@gmail.com',
        uuid:       '4ea9dca7-1f51-4f5d-8e54-336bb11974b9',
        name:       'Tester'
      )
    end

  end
end