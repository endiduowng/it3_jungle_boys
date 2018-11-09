class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :review_score
      t.string :review_description
      t.references :user, foreign_key: true
      t.references :anime, foreign_key: true
      t.timestamps
    end
  end
end
