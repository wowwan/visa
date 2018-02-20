class AddColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :qty, :integer
  end
end
