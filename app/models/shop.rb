class Shop < ActiveRecord::Base
  # validates :name, :presence => true
  # validates :address, :presence => true
  # validates :phone, :presence => true
  geocoded_by :address #CAN ALSO BE AND IP ADDRESS
  after_validation :geocode
  has_many :barbers

  def blob
    <<-TEXT
      <a href="shops/#{self.id}">#{name}</a>
    TEXT
  end

end
