class ChangeFullPriceToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column(:bookings, :full_price, :float)
  end
end
