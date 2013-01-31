class Reservation < ActiveRecord::Base
  belongs_to :ad
  attr_accessible :pooler_id, :seats, :seen, :confirmed
end
