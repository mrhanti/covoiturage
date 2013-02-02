class ReservationsController < ApplicationController
  def create
    @user = User.find_by_id(params[:user_id])
    @ad = @user.ads.find_by_id(params[:ad_id]) if @user

    @reservation = Reservation.new(params[:reservation])
    
    @ad.reservations.push(@reservation)

    if @ad.save
      flash[:notice] = "You're reservation was confirmed"
      Mailer.new_reservation(@reservation).deliver
    else
      @reservation.reload
      flash[:notice] = "Can't confirm you're going"
    end

    redirect_to proc { user_ad_path(@user, @ad) }
  end
end
