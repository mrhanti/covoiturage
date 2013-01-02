class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  attr_accessible :phone_number, :year_of_birth, :gender
  attr_accessible :avatar, :remove_avatar

  has_many :ads, :dependent => :destroy 

  mount_uploader :avatar, AvatarUploader

  validates :email, :presence => true 
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
