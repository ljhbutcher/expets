class AddPricePerDayToExoticPets < ActiveRecord::Migration[7.1]
  def change
    add_column :exotic_pets, :price_per_day, :integer
  end
end
