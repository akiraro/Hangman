class DropSesidGame < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :ses_id
  end
end
