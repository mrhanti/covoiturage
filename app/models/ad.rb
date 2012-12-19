class Ad < ActiveRecord::Base
  attr_accessible :departure, :destination, :departure_on, :departure_at
  attr_accessible :seat_limit, :price_per_seat, :highway, :itinerary

  belongs_to :user
  has_one :confirmation
  
  validates :destination, :departure, :departure_on, :departure_on, :presence => true

  def generate_confirmation_code
    self.confirmation = Confirmation.create
  end
end
