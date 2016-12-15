class EventsController < ApplicationController
  def index

  	    @current_user = User.find(session[:user_id])
  	   @users_joined = @current_user.events_joined
    	@user = User.find(session[:user_id])
    	@states = states
    	@my_state = Event.joins(:user).where('events.state = ?', @user.state).select(:date, 'events.state AS events_state', :name, :first_name, :city,'events.id AS events_id', :id)
    	@other_states = Event.joins(:user).where.not('events.state = ?', @user.state).select(:date, 'events.state AS events_state', :name, :first_name, :city,'events.id AS events_id', :id)
    
  end
  def states
   ["AL", "AK", "AZ", "AR", "CA", "CO", "CT"," DC", "DE", "FL", "GA","HI", "ID","IL", "IN", "IA" ,"KS", "KY", "LA", "ME","MA","MI","MN", "MO","MS",
"MT", "NE"," NV", "NH"," NJ"," NM"," NY", "NC", "ND", "OH", "OK" ,"OR", "PA","RI", "SC", "SD", "TN", "TX", "UT", "VA","VT","WA", "WI", "WV", "WY"]
  end
  def create
   	user = User.find(session[:user_id])
  	@event = Event.new(event_params)
  	@event.user = user
  	if @event.save
  		redirect_to "/events/#{@event.id}"
  	else 
  		redirect_to :back
  	end

  end
  def addcomment
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    comment = Comment.create(user: user, event: event, content: params[:comment][:content])
        redirect_to :back

  end
  def delete
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    event.destroy
    redirect_to :back
  end
  def edit
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    @states = states
  end
  def update 
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    event.attributes = event_params
    if event.save(validate: false)
      redirect_to "/events"
    else 
      redirect_to :back
    end
  end
  def join
  	user = User.find(session[:user_id])
  	event = Event.find(params[:id])
  	join = Guest.create(user: user, event: event)
  	redirect_to :back
  end
    def unjoin
  	user = User.find(session[:user_id])
  	event = Event.find(params[:id])
  	a_join = Guest.find_by(user: user, event: event)
  	a_join.destroy
  	redirect_to :back
  end
  def show
  	@event = Event.find(params[:id])
    @guest = Guest.where(event: @event)
    @guests = Guest.joins(:user).joins(:event).where(event:@event).select(:first_name, :last_name, 'users.state AS user_state', 'users.city AS user_city')
    @comments = Comment.joins(:user).where(event: @event).select(:content, :first_name)
  end
  private
   def event_params
  params.require(:event).permit(:city, :state, :date, :name)
 end
  def comment_params 
    params.require(:comment).permit(:content, :user, :event)
  end
end
