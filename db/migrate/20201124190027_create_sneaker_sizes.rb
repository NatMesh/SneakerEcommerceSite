class CreateSneakerSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sneaker_sizes do |t|
      t.references :sneaker, null: false, foreign_key: true
      t.references :size_range, null: false, foreign_key: true

      t.timestamps
    end
  end
end
