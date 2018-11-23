class ChangeReviewScoreToBeFloatInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :review_score, :float
  end
end
