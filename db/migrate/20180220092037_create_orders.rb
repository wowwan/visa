class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :visa
      t.boolean :fast_track
      t.boolean :private_letter
      t.integer :amount
      t.string :speed
      t.string :border_point
      t.date :entry_date
      t.string :email
      t.string :customer_name
      t.string :phone
      t.string :passport_number
      t.string :passport_name
      t.string :nationality
      t.date :passport_issued
      t.date :passport_end
      t.string :gender
      t.date :birthday

      t.timestamps null: false
    end
  end
end
