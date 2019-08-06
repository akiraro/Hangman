class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :ses_id
      t.integer :diff_id
      t.integer :data_id
      t.string :guesses
      t.integer :chances

      t.timestamps
    end
  end
end
