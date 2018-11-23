class ChangeReviewVisualScoreToBeFloatInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :review_visual_score, :float
  end
end
