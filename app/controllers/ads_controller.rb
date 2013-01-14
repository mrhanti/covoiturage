class AdsController < ApplicationController
  before_filter :find_user, :only => [:new, :create, :show, :destroy]
  before_filter :authenticate_user!, :only => [:new, :create, :destroy]
  
  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params[:ad])

    @user.ads << @ad

    if @user.save
      flash[:notice] = "ad created successfully for #{@user.full_name}"
      Mailer.confirm_ad_creation(@ad).deliver
    else
      @user.reload
      flash[:notice] = "couldn't create ad..."
    end

    redirect_to proc { user_ad_path(@user, @ad) }
  end

  def show
    @ad = @user.ads.find_by_id(params[:id]) unless @ad
  end

  def destroy
    @ad = @user.ads.find(params[:id]) 
        
    if @ad.destroy
      flash[:notice] = "You're ad was succcessfully destroyed"
    else
      flash[:notice] = "You're ad was not destroyed"
    end

    redirect_to proc { user_profile_path }
  end

  def search
    @q = Ad.search(params[:q])
    @ads = @q.result()
  end

  private

  def find_user
    @user = User.find(params[:user_id]) || not_found
  end
end
