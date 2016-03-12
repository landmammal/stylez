class AddBarberIdtoReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :barber_id, :integer
  end
end
