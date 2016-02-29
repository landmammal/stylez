class AddShopIdToBarber < ActiveRecord::Migration
  def change
    add_column :barbers, :shop_id, :integer
  end
end
