class Ad < ActiveRecord::Base
  attr_accessible :departure, :destination, :departure_on, :departure_at
  attr_accessible :seat_limit, :price_per_seat, :highway, :itinerary

  belongs_to :user
  has_one :confirmation, :dependent => :destroy

  before_save :generate_confirmation_code
  
  validates :destination, :departure, :departure_on, :departure_on, :presence => true
  validates :seat_limit, :price_per_seat, :presence => true

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
