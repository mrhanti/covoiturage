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

  def edit
    @user = User.find_by_id(params[:id]) || User.new
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = "User #{@user.full_name} updated"
    else
      flash[:notice] = "couldn't update user #{@user.full_name}"
    end

    @user.reload
    redirect_to :action => :edit
  end
end
