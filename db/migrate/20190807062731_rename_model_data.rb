class RenameModelData < ActiveRecord::Migration[5.2]
  def change
    rename_table :data, :store
  end
end
