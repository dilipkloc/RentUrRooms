class DropPermissionsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :permissions
  end
end
