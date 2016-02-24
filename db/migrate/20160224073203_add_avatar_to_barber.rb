class AddAvatarToBarber < ActiveRecord::Migration

  def self.up
    add_attachment :barbers, :avatar
  end

  def self.down
    remove_attachment :barbers, :avatar
  end


end
