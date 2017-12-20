module Services

  module Seeds
    require_relative 'seeds/providers_seed'
    require_relative 'seeds/beers_seed'
    require_relative 'seeds/users_seed'
  end

  module Api
    require_relative 'api/api'
  end

end