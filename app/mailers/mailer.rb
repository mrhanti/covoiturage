class Mailer < Devise::Mailer
  helper :application
  default from: "mr.el.hanti@gmail.com"

  def confirm_ad_creation(ad)
    @ad = ad
    @user = ad.user
    @token = ad.confirmation.token
    mail(to: @user.email, subject: "Your ad is confirmed!!")
  end
end
