class Barber < ActiveRecord::Base
  has_secure_password
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  belongs_to :shop
  has_many :followers, through: :passive_relationships, source: :follower
  # validates :name, :presence => true
  # validates :avatar, :presence => true
  # validates :instagram, :presence => tr



  has_attached_file :avatar, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }


    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    # ratyrate_rateable "Rating"

    def feed



    end

    # Follows a customer.
    def follow(customer)
      active_relationships.create(followed_id: customer_id)
    end

    # Unfollows a customer.
    def unfollow(customer)
      active_relationships.find_by(followed_id: customer_id).destroy
    end

    # Returns true if the current barber is following the current customer.
    def following?(customer)
      following.include?(customer_id)
    end

    private
end
