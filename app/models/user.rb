class User < ApplicationRecord
  has_many :adds

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  # User Avatar Validation
  validates_integrity_of  :image
  validates_processing_of :image
end
