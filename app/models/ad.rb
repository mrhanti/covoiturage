class Ad < ActiveRecord::Base

  # Attributes Accessibility
  attr_accessible :departure, :destination, :departure_on, :departure_at
  attr_accessible :seat_limit, :price_per_seat, :highway, :itinerary

  # Associations
  has_and_belongs_to_many :users
  has_one :confirmation, :dependent => :destroy

  # Validations
  validates :destination, :departure, :departure_on, :departure_on, :presence => true
  validates :seat_limit, :price_per_seat, :presence => true

  # Callbacks
  before_save :generate_confirmation_code
  after_save :label_owner   

  def generate_confirmation_code
    self.confirmation = Confirmation.create
  end

  def belongs_to?(user)
    self.user == user
  end
  
  def to_s
  	"#{departure} -> #{destination} on #{departure_on} at #{departure_at}"
  end
end
