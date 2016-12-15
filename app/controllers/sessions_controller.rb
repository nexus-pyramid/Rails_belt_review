class SessionsController < ApplicationController
  def login
  end
 #  def create
	# 	u = User.find_by_email(params[:email])
	# 	if (u && u.authenticate(params[:password]))
	# 	session[:user_id] = u.id
	# 	redirect_to "/users/#{u.id}"
	# else	
	# 	flash[:error] = "Invalid login info"
	# 	redirect_to :back
	# 	end
	# end
end
