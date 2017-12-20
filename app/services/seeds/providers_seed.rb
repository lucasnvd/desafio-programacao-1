module Services::Seeds
  class ProvidersSeed

    def self.call
      6.times do
        company_name = Faker::Company.name

        next if Provider.exists?(name: company_name)
        Provider.create(
          contact_email: Faker::Internet.email(company_name),
          contact_phone: Faker::PhoneNumber.cell_phone,
          address:       Faker::Address.full_address,
          name:          company_name
        )
      end
    end

  end
end
