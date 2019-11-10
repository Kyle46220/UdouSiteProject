class Profile < ApplicationRecord
  belongs_to :user
  has_many :collections, dependent: :destroy
  has_many :carts, dependent: :destroy

  has_many :reviews, through: :carts, dependent: :destroy
  enum email_opt_in:{yes: 0, no:1 }
  enum user_type:{admin: 0, customer:1}

  validates :name, :user_type, :email_opt_in, presence: true


end
