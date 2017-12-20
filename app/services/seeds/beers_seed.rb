module Services::Seeds
  class BeersSeed

    def self.call
      new.call
    end

    def call
      count = 0

      until count == 50
        beer_name = Faker::Beer.name

        unless Beer.exists?(name: beer_name)
          beer = generate_beer(beer_name)
          generate_provider(beer)

          count += 1
          beer.save
        end
      end
    end

    private

    def generate_beer(beer_name)
      available = rand(1..150)
      price     = rand(9..200).to_f

      Beer.new(
        available: available,
        alcohol:   Faker::Beer.alcohol.delete('%').to_f,
        malts:     Faker::Beer.malts,
        price:     (price + (price / 10.0)).round(2),
        name:      beer_name
      )
    end

    def generate_provider(beer)
      providers.take(rand(1..3)).each do |provider|
        beer.providers << provider
      end
    end

    def providers
      @providers ||= Provider.all
    end

  end
end
