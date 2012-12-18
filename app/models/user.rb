class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  attr_accessible :phone_number, :year_of_birth, :gender

  validates_uniqueness_of :email, :message => "user already registred"
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
