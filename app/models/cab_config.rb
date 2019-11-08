class CabConfig < ApplicationRecord 
  include ::CabConfigsHelper
  
  belongs_to :collection
  has_many :upload, dependent: :destroy
  # has_one :profile, through: :collection, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one :upload, dependent: :destroy
  enum style:{pigeonhole: 0, grid: 1, slanted: 2, variable: 3 }
  enum colour:{natural: 0, black: 1, white: 2, red: 3, grey: 4 }

end
