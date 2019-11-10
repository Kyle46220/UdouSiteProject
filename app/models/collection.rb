class Collection < ApplicationRecord
  belongs_to :profile
  has_many :cab_configs, dependent: :destroy
  validates :name, :public_display, presence: true
end
