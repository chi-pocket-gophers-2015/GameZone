class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :players_min
      t.integer :players_max
      t.integer :duration
      t.string :complexity

      t.timestamps null: false
    end
  end
end
