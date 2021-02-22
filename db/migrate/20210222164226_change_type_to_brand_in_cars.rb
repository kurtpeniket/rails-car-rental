class ChangeTypeToBrandInCars < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :type, :brand
  end
end
