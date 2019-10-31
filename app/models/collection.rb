class Collection < ApplicationRecord
  belongs_to :profile
  has_many :cab_configs, dependent: :destroy
end
