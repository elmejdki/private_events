class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @attendees = Event.find(params[:id]).attendees
    out_ids = @attendees.map{ |attendee| attendee.id }.push( session[:user_id] )
    @users = User.where('id NOT IN (?)', out_ids)
  end

  def new
    @event = Event.new
  end

  def create
    @event = User.find(session[:user_id]).events.build(event_params)

    if @event.save
      redirect_to events_path, notice: 'New event created'
    else
      render :new, alert: 'No event created'
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :body, :date, :place)
  end
end
