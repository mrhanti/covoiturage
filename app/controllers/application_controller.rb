class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  	@q = Ad.search(params[:q])
  	# @ads = @q.result(:distinct => true)
  end

  private
  def after_sign_in_path_for(user)
    user_profile_path
  end
  
  def after_sign_out_path_for(user)
    root_path
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
