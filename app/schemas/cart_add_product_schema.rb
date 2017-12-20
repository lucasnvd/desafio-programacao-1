CartAddProductSchema = Dry::Validation.Form do

  required(:requested_quantity).filled(:int?, gt?: 0)
  required(:requested_beer_id).filled(:int?)

end