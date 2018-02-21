class Image < ActiveRecord::Base
  include Protectable
  attr_accessor :image_content

  has_many :thing_images, inverse_of: :image, dependent: :destroy
  has_many :things, through: :thing_images

  scope :user_id_null,	-> {where(:user_id => nil)}

  def basename
    caption || "image-#{id}"
  end
end
