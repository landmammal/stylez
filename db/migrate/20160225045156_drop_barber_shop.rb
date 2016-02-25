class DropBarberShop < ActiveRecord::Migration
  def change
    drop_table :barber_shops
  end
end
