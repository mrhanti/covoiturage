require "digest/sha1"

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  attr_accessible :phone_number, :year_of_birth, :gender

  has_many :ads, :dependent => :destroy

  before_create :generate_encrypted_id

  validates :email, :presence => true
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def generate_encrypted_id
  	self.id = Digest::SHA1.hexdigest(self.email)
  end
end
