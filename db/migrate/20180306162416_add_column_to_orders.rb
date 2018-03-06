class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :image_uid, :string
  end
end
