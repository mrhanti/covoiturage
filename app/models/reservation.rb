class Reservation < ActiveRecord::Base
  belongs_to :ad
  attr_accessible :pooler_id, :seats, :message, :seen, :confirmed

  after_update :check_confirmation

  def check_confirmation
    if self.confirmed_changed?
      ad = self.ad
      ad.seat_limit -= self.seats
      ad.save
    end
  end
end
