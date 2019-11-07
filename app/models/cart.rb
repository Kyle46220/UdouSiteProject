class Cart < ApplicationRecord
  # belongs_to :profile
  has_many :cart_items, dependent: :destroy
  has_many :cab_configs, through: :cart_items
  has_one :review, dependent: :destroy
end
