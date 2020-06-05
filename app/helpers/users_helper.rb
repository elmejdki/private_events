module UsersHelper
  def error_action(field)
    if @user.errors[field].any?
      render partial: 'error_handler', locals: {source: field}
    end
  end

  def trash_action
    if @user.id == session[:user_id]
      render 'trash_icon'
    end
  end
end
