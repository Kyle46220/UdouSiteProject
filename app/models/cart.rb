class Cart < ApplicationRecord
  # belongs_to :profile
  has_many :cart_items, dependent: :destroy
  has_many :cab_configs, through: :cart_items
  has_one :review, dependent: :destroy

  def sub_total
    sum = 0
    self.cart_items.each do |cart_item|
      sum+= cart_item.total_price
    end
    return sum
  end
  
end
