class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :hotel_name
      t.string :hotel_detail
      t.integer :price
      t.string :address
      t.string :hotel_image

      t.timestamps
    end
  end
end
