class Shop < ActiveRecord::Base
  # validates :name, :presence => true
  # validates :address, :presence => true
  # validates :phone, :presence => true
  geocoded_by :address #CAN ALSO BE AND IP ADDRESS
  after_validation :geocode
  has_many :barbers

  def window
    <<-TEXT
      <h3><a href="shops/#{self.id}">#{name}</a></h3>


            <h1 id="firstHeading" class="firstHeading">Uluru</h1>

    TEXT
  end

  def directions
     "<a target='blank' href='https://www.google.com/maps/place/"+"#{self.address}"+"'>Get Directions</a>"
  end


















end
