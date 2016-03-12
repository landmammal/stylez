class Shop < ActiveRecord::Base
  # validates :name, :presence => true
  # validates :address, :presence => true
  # validates :phone, :presence => true
  geocoded_by :address #CAN ALSO BE AND IP ADDRESS
  after_validation :geocode
  has_many :barbers

  def window
    <<-TEXT
      <h3><a href="shops/#{self.id}" class="info-name">#{name}</a></h3>
      <h5 id="firstHeading" class="firstHeading">Description</h5>
      <p>Miami's Genuine Old-Fashioned Barbershop, specializing is classic hot-lather shaves, haircuts, and shoe shines, that will leave you looking better than you have ever looked before.</p>
    TEXT
  end

  # passes directions to google info window
  def directions
     "<a id='directions' target='blank' href='https://www.google.com/maps/place/"+"#{self.address}"+"'>Get Directions</a>"
  end


















end
