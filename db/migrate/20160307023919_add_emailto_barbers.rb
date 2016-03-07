class AddEmailtoBarbers < ActiveRecord::Migration
  def change
    add_column :barbers, :email, :string
  end
end
