class Item < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  # paperclip for the bucket list items
  has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :location
end
