class Mailer < Devise::Mailer
  helper :application
  default from: "mr.el.hanti@gmail.com"

  def confirm_ad_creation(ad)
    @ad = ad
    @user = ad.user
    @token = ad.confirmation.token
    mail(to: @user.email, subject: "Your ad is confirmed!!")
  end

  def new_reservation(reservation)
  	@reservation = reservation
  	@pooler = User.find(reservation.pooler_id)
  	@ad = reservation.ad
  	@user = @ad.user
  	
  	mail(to: @user.email, subject: "New Reservation!")
  end
end
