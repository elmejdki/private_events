module ApplicationHelper
  def notification_handler
    if flash[:notice]
      render 'notification'
    end
  end

  def alert_handler
    if flash[:alert]
      render 'alert'
    end
  end

  def session_handler
    if session[:user_id].nil?
      render 'sign_in_menu'
    else
      render 'log_out_menu'
    end 
  end
end
