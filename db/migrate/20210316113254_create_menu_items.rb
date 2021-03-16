class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
