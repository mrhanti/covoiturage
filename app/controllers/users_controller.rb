class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  
    if @user.save
      flash[:notice] = "user created successfully"
    else
      flash[:notice] = "user not created successfully"
    end
  end
end
