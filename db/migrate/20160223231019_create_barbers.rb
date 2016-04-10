class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
      t.string :name
      t.string :instagram
      t.integer :phone
      t.string :photo
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
