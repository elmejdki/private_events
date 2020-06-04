class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @attendees = Event.find(params[:id]).attendees
    out_ids = @attendees.map(&:id).push(session[:user_id])
    @users = User.where('id NOT IN (?)', out_ids)
    @invite = EventsUser.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = User.find(session[:user_id]).events.build(event_params)
    
    if @event.save
      @invite = EventsUser.new(attendee_id: session[:user_id], attended_event_id: @event.id)

      if @invite.save
        redirect_to events_path, notice: 'A new event was created successfuly'
      else
        @event.destroy
        render :new, alert: 'Fatal error for some reason we can\'t save your event'
      end
    else
      render :new, alert: 'Fatal error, No event was created'
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :body, :date, :place)
  end
end
