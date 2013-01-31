class Confirmation < ActiveRecord::Base
  attr_accessible :token

  FRIENDLY_CHARS = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    
  belongs_to :ad
  
  before_create :generate_token
  
  def generate_token
    return unless self.token.nil?
    
    newpass = ""
    1.upto(8) { |i| newpass << FRIENDLY_CHARS[rand(FRIENDLY_CHARS.size-1)] }
    self.token = newpass
  end  
end
