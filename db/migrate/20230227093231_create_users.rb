class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :input_password
      t.string :confirmation_password

      t.timestamps
    end
  end
end
