module EventsHelper
  def error_action(field)
    if @user.errors[field].any?
      render 'error_handler', locals: {source: field}
    end
  end
end
