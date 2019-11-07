class CartItem < ApplicationRecord
  belongs_to :cab_config
  belongs_to :cart
  belongs_to :order
end
