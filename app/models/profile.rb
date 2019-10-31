class Profile < ApplicationRecord
  belongs_to :user
  has_many :collections, dependent: :destroy
  has_many :carts, dependent: :destroy

  has_many :reviews, through: :carts, dependent: :destroy
  
end
