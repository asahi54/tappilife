class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.references :shop
      t.string :size
      t.string :sweetness
      t.integer :calorie

      t.timestamps
    end
  end
end
