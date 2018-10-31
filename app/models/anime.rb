class Anime < ApplicationRecord
  has_many :adds
  has_many :reviews, -> {order(:created_at => :desc)}

  def is_added user
    if user
      Add.find_by(user_id: user.id, anime_id: id)
    end
  end
end
