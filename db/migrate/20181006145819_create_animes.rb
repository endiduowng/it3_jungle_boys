class CreateAnimes < ActiveRecord::Migration[5.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.string :kind
      t.string :producer
      t.string :licencer
      t.integer :episode
      t.date :premiered
      t.string :studio
      t.string :source
      t.string :genre
      t.integer :duration
      t.string :picture
      t.string :rating
      t.integer :score
      t.text :description

      t.timestamps
    end
  end
end
