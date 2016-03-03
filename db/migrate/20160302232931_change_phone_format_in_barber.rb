class ChangePhoneFormatInBarber < ActiveRecord::Migration

    def up
      change_column :barbers, :phone, :string
    end

    def down
      change_column :barbers, :phone, :integer
    end
  end
