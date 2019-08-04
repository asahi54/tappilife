class CreateTakes < ActiveRecord::Migration[5.2]
  def change
    create_table :takes do |t|
      t.references :user, foreign_key: true
      t.references :drink, foreign_key: true

      t.timestamps
    end
  end
end
