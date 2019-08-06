class RenameSessions < ActiveRecord::Migration[5.2]
  def change
    rename_table :sessions, :seshs
  end
end
