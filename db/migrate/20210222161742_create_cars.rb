class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :price_per_day
      t.string :type
      t.string :model
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
