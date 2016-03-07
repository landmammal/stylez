class AddPWdigesttoBarber < ActiveRecord::Migration
  def change
    add_column :barbers, :password_digest, :string
  end
end
