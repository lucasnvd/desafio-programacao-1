class BeerRepresenter < RepresenterBase

  property :available, if: -> (user_options:, **) { user_options[:include_availability] }
  property :alcohol, render_filter: -> (i, _) { "#{ i.to_s.gsub('.', ',') }%" }
  property :price,   render_filter: -> (i, _) { "$ #{ i.to_s }" }
  property :malts
  property :name

end
