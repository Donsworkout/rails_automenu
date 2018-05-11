class CreateMenuNames < ActiveRecord::Migration
  def change
    create_table :menu_names do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
