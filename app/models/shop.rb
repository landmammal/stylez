class Shop < ActiveRecord::Base
  # validates :name, :presence => true
  # validates :address, :presence => true
  # validates :phone, :presence => true

  has_many :barbers
end
