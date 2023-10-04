class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :image
      t.string :description
      t.decimal :price
      t.string :model
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
