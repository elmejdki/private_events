module ApplicationHelper
  def notification_handler
    render 'notification' if flash[:notice]
  end

  def alert_handler
    render 'alert' if flash[:alert]
  end

  def session_handler
    if session[:user_id].nil?
      render 'sign_in_menu'
    else
      render 'log_out_menu'
    end
  end
end
