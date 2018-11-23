class AddStoryVisualAudioScoreToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :review_story_score, :integer
    add_column :reviews, :review_visual_score, :integer
    add_column :reviews, :review_audio_score, :integer
  end
end
