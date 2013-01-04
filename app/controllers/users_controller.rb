class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:profile, :update]
  
  def profile
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = "User #{@user.full_name} updated"
    else
      flash[:notice] = "couldn't update user #{@user.full_name}"
    end

    @user.reload
    redirect_to :action => :profile
  end
end
