class AddAddressToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :address, :string
  end
end
