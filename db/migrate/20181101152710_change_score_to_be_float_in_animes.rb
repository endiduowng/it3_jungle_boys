class ChangeScoreToBeFloatInAnimes < ActiveRecord::Migration[5.1]
  def change
    change_column :animes, :score, :float
  end
end
