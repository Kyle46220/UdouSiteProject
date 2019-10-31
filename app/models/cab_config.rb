class CabConfig < ApplicationRecord
  
  belongs_to :collection
  has_many :upload, dependent: :destroy
  # has_one :profile, through: :collection, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one :upload, dependent: :destroy

end
