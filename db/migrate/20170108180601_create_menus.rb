class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :image
      t.integer :popularity

      t.timestamps
    end
  end
end
