class EventsusersController < ApplicationController
  def create
    @invite = EventsUser.new(attendee_id: params[:events_user][:attendee_id], attended_event_id: params[:id])
    if @invite.save
      redirect_to events_path, notice: 'user was invited to the event successfully'
    else
      redirect_to events_path, alert: 'User was not invited to the event please try again'
    end
  end

  def destroy
    @invite = EventsUser.find_by(attendee_id: params[:attendee_id], attended_event_id: params[:event_id])
    @invite.destroy
    redirect_to events_path, notice: 'user is no more invited to the event'
  end
end
