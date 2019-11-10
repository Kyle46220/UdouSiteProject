class CabConfig < ApplicationRecord 
  include ::CabConfigsHelper
  
  belongs_to :collection
  has_many :upload, dependent: :destroy
  # has_one :profile, through: :collection, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one :upload, dependent: :destroy
  enum style:{pigeonhole: 0, grid: 1, slanted: 2, variable: 3 }
  enum colour:{natural: 0, black: 1, white: 2, red: 3, grey: 4 }
  enum depth:{"180mm": 180, "280mm": 280, "380mm": 380, "580mm": 580 }

  
  validates :height, :width, :depth, :style, :colour, :shelf_qty, :drawer_qty, :cupboard_qty, :back_panel,  presence: true

  validates :height, :width, numericality: {less_than: 2400 }
  validates :shelf_qty, :cupboard_qty, :drawer_qty, numericality: {less_than: 10 }
end
