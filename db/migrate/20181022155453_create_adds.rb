class CreateAdds < ActiveRecord::Migration[5.1]
  def change
    create_table :adds do |t|
      t.references :anime, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
