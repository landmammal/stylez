class Barber < ActiveRecord::Base
  belongs_to :shop
  # friend.avatar.url => http://your_bucket_name.s3.amazonaws.com/...


  has_attached_file :avatar, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }




    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
