class ChangePricePerDay < ActiveRecord::Migration[6.1]
  def change
    change_column(:vehicles, :price_per_day, :float)
  end
end
