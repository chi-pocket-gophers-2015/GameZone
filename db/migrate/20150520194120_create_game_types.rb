class CreateGameTypes < ActiveRecord::Migration
  def change
    create_table :game_types do |t|
      t.references :game, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
