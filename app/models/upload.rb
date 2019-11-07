class Upload < ApplicationRecord
  belongs_to :cab_config
  has_one_attached :image_upload
end
