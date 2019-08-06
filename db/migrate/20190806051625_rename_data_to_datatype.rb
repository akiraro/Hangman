class RenameDataToDatatype < ActiveRecord::Migration[5.2]
  def change
    rename_column :data, :type, :data_type
  end
end
