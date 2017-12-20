class CartRepresenter < RepresenterBase

  property :created_at, render_filter: ->(i, _) { i.strftime(DEFAULT_DATE_FORMAT) }
  property :updated_at, render_filter: ->(i, _) { i.strftime(DEFAULT_DATE_FORMAT) }
  property :status
  property :id

  collection :items, decorator: CartItemRepresenter

end