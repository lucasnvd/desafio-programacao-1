class CartItemRepresenter < RepresenterBase

  property :requested_quantity
  property :removed

  property :created_at, render_filter: ->(i, _) { i.strftime(DEFAULT_DATE_FORMAT) }
  property :updated_at, render_filter: ->(i, _) { i.strftime(DEFAULT_DATE_FORMAT) }

  property :beer, decorator: BeerRepresenter


end