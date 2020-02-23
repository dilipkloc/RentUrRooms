class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.float :price
      t.text :rules
      t.text :address
      t.string :images
      t.decimal :latitude
      t.decimal :longitude
      t.integer :city_id
      t.integer :user_id

      t.timestamps
    end
  end
end
