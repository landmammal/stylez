class ChangeUsertoCustomer < ActiveRecord::Migration
  def change
    rename_column :reviews, :user_id, :customer_id
  end
end
