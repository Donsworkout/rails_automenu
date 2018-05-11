class AddTriggerToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :trigger, :boolean, default: false 
  end
end
