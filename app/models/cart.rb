class Cart < ApplicationRecord
  belongs_to :profile
  has_many :cart_items, dependent: :destroy
  has_one :review, dependent: :destroy
end
