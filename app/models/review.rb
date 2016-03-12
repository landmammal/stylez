class Review < ActiveRecord::Base
  belongs_to :barber
  belongs_to :customer
end
