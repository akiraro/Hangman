class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.integer :diff_id
      t.string :data
      t.string :type

      t.timestamps
    end
  end
end
