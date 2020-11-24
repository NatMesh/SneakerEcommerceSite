class CreateSizeRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :size_ranges do |t|
      t.float :size_number

      t.timestamps
    end
  end
end
