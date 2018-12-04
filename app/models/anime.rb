require "time"
class Anime < ApplicationRecord
  attr_accessor :review_score
  attr_accessor :check_added
  has_many :adds
  has_many :reviews, -> {order(:created_at => :desc)}

  def is_added user
    if user
      Add.find_by(user_id: user.id, anime_id: id)
    end
  end

  def self.select_top_airing
    Anime.
      where("premiered < ?", Date.today).
      order(score: :desc)
  end

  def self.select_top_upcoming
    Anime.
      where("premiered > ?", Date.today).
      order(score: :desc)
  end

  def get_score_from_user(user)
    reviewObj = Review.where("user_id = ? and anime_id = ?", user.id, id).first
  end

end
