class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :rating
      t.string :picture


      t.timestamps null: false
    end
  end
end
