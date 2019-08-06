class RenameSessions2 < ActiveRecord::Migration[5.2]
  def change
    rename_table :seshs, :seshes
  end
end
