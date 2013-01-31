class Ad < ActiveRecord::Base

  # Attributes Accessibility
  attr_accessible :departure, :destination, :departure_on, :departure_at
  attr_accessible :seat_limit, :price_per_seat, :highway, :itinerary
  attr_protected :poolers_ids
  
  # Associations
  belongs_to :user
  has_one :confirmation, :dependent => :destroy
  has_many :reservations, :dependent => :destroy

  # Validations
  validates :destination, :departure, :departure_on, :departure_at, :presence => true
  validates :seat_limit, :price_per_seat, :presence => true

  # Callbacks
  before_save :generate_confirmation_code

  # Serializer
  serialize :poolers_ids, Array

  # seen
  # 
  def generate_confirmation_code
    self.confirmation = Confirmation.create
  end

  def subscribe(user)
    self.poolers_ids.push(user.id)
  end

  def poolers
    klass = self.user.class
    klass.where(id: self.poolers_ids)
  end

  def belongs_to?(user)
    self.user == user
  end
  
  def to_s
  	"#{departure} -> #{destination} on #{departure_on} at #{departure_at}"
  end
end
