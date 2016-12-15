class UsersController < ApplicationController
  def index
  	  	@states = states

  end

  def create
  	@states = states
  	u = User.new(user_params)
		if u.save
			flash[:notice] = "user has been successfully created"
			redirect_to :back
		else 
		flash[:error] = "Invalid reg info"
		redirect_to :back
		end
  end
  def login
  		k = User.find_by_email(params[:email])
		if (k && k.authenticate(params[:password]))
		session[:user_id] = k.id
		redirect_to "/events"
	else	
		flash[:error] = "Invalid login info"
		redirect_to :back
		end
  end
  def states
   ["AL", "AK", "AZ", "AR", "CA", "CO", "CT"," DC", "DE", "FL", "GA","HI", "ID","IL", "IN", "IA" ,"KS", "KY", "LA", "ME","MA","MI","MN", "MO","MS",
"MT", "NE"," NV", "NH"," NJ"," NM"," NY", "NC", "ND", "OH", "OK" ,"OR", "PA","RI", "SC", "SD", "TN", "TX", "UT", "VA","VT","WA", "WI", "WV", "WY"]
  end
  def edit
    @user = User.find(session[:user_id])
      @states = states
  end
  def update
    @user = User.find(session[:user_id])
      @user.attributes = user_params
    if @user.save(validate: false)
    redirect_to "/events", notice: "user has been updated"
    else 
    redirect_to :back
    end
  end

  def show
  end
  private
	 def user_params
	 	params.require(:user).permit(:First_name, :Last_name, :email, :password, :city, :password_confirmation, :state )
	 end
end
