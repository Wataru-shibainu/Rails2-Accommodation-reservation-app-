class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :introduction
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
