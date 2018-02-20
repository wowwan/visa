class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :desc

      t.timestamps null: false
    end
  end
end
