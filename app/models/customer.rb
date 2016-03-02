class Customer < ActiveRecord::Base
  has_secure_password
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:  :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:  :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  def feed



  end

  # Follows a user.
  def follow(barber)
    active_relationships.create(followed_id: barber_id)
  end

  # Unfollows a user.
  def unfollow(barber)
    active_relationships.find_by(followed_id: barber_id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(barber)
    following.include?(barber_id)
  end

  private

end
