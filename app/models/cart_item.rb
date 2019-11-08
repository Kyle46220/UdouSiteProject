class CartItem < ApplicationRecord
  belongs_to :cab_config
  belongs_to :cart
  belongs_to :order, optional: true

  def total_price
    self.quantity * self.cab_config.price
  end
  
end
