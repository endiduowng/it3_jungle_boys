class ChangeReviewAudioScoreToBeFloatInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :review_audio_score, :float
  end
end
