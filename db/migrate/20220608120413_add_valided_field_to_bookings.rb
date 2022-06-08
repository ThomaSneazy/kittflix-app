class AddValidedFieldToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :validated, :boolean, default: false
  end
end
