class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  	@q = Ad.search(params[:q])
  	# @ads = @q.result(:distinct => true)
  end
end
