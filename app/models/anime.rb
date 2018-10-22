class Anime < ApplicationRecord
  has_many :adds

  def is_added user
    if user
      Add.find_by(user_id: user.id, anime_id: id)
    end
  end
end
