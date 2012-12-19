class AdsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @ads = @user.ads
  end

  def new
    @user = User.find(params[:user_id])
    @ad = Ad.new
  end

  def create
    @user = User.find(params[:user_id])
    @ad = Ad.new(params[:ad])

    @user.ads << @ad

    if @user.save
      flash[:notice] = "ad created successfully for #{@user.first_name} #{@user.last_name}"
    else
      @user.reload
      flash[:notice] = "couldn't create ad..."
    end

    redirect_to :action => :index
  end
end
