class AdsController < ApplicationController
  before_filter :find_user, :only => [:new, :create, :show]
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params[:ad])

    @user.ads << @ad

    if @user.save
      flash[:notice] = "ad created successfully for #{@user.full_name}"
    else
      @user.reload
      flash[:notice] = "couldn't create ad..."
    end

    redirect_to :action => :show
  end

  def show
    @ad = @user.ads.find_by_id(params[:id]) unless @ad
  end

  def destroy
    # destroy an ad..
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
