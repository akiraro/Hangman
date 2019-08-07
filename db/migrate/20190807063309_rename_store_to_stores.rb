class RenameStoreToStores < ActiveRecord::Migration[5.2]
  def change
    rename_table :store, :stores
  end
end
