class User < ApplicationRecord
  has_many :adds
  has_many :reviews

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  # User Avatar Validation
  validates_integrity_of  :image
  validates_processing_of :image

  def set_default_role
    self.role ||= :user
  end

  def is_admin?
    return self.role == "admin"
  end
end
