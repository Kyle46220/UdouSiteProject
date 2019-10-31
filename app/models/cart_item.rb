class CartItem < ApplicationRecord
  belongs_to :cab_config
  belongs_to :cart
end
