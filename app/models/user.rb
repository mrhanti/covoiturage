class User < ActiveRecord::Base

  # Attributes Accessibility
  attr_accessible :first_name, :last_name, :email
  attr_accessible :phone_number, :year_of_birth, :gender, :owner
  attr_accessible :avatar, :remove_avatar
  attr_accessible :password, :password_confirmation, :remember_me, :current_password
  attr_accessible :smoking_allowed, :luggage_allowed, :luggage_weight, :music_allowed, :multi_stop, :usual

  # Associations
  has_many :ads, :dependent => :destroy

  # Validations
  validates :email, :presence => true 

  # Devise & CarrierWave
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader  
  
  # Callbacks

  def full_name
    return nil unless self.first_name && self.last_name
    [self.first_name, self.last_name].join(' ')
  end

  def has_avatar?
  	self.avatar.to_s.match(/assets\/default_avatar\.png/).nil?
  end
end
