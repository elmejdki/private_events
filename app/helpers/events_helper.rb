module EventsHelper
  def event_error_action(field)
    render partial: 'error_handler', locals: { source: field } if @event.errors[field].any?
  end
end
