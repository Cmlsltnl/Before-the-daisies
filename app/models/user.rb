class User < ActiveRecord::Base
  has_many :items
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :comments

  # paperclip for the user
  has_attached_file :image, styles: { medium: "150x150>", thumb: "50x50>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
