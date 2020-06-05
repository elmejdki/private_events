module EventsHelper
  def event_error_action(field)
    if @event.errors[field].any?
      render partial: 'error_handler', locals: {source: field}
    end
  end
end
