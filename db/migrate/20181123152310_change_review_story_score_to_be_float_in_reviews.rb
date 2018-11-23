class ChangeReviewStoryScoreToBeFloatInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :review_story_score, :float
  end
end
