class AddExitDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :exit_date, :date
  end
end
