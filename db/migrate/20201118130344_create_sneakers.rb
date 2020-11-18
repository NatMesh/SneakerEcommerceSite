class CreateSneakers < ActiveRecord::Migration[6.0]
  def change
    create_table :sneakers do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :designer, null: false, foreign_key: true
      t.string :main_colour
      t.string :colour_way
      t.string :gender
      t.text :grid_picture
      t.text :main_picture
      t.string :midsole
      t.string :name
      t.string :nickname
      t.string :release_date
      t.integer :price_cents
      t.text :shoe_story
      t.string :upper_material

      t.timestamps
    end
  end
end
