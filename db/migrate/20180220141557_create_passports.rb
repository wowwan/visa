class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.references :order, index: true, foreign_key: true
      t.string :number
      t.string :nationality
      t.string :gender
      t.date :issue_date
      t.date :finish_date
      t.string :name
      t.date :birhday

      t.timestamps null: false
    end
  end
end
