class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "Barber"
  belongs_to :followed, class_name: "Barber"

  belongs_to :follower, class_name: "Customer"
  belongs_to :followed, class_name: "Customer"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
