class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :count
      t.timestamps null: false
      t.belongs_to  :order
    end
  end
end
