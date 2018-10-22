class Add < ApplicationRecord
  belongs_to :anime
  belongs_to :user

  validates :user_id, uniqueness: {scope: :anime_id}
end
