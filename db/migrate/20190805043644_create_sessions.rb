class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :status
      t.integer :score

      t.timestamps
    end
  end
end
