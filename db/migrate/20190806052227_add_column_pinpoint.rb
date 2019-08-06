class AddColumnPinpoint < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :pinpoint, :string
  end
end
