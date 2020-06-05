module UsersHelper
  def error_action(field)
    render partial: 'error_handler', locals: { source: field } if @user.errors[field].any?
  end

  def trash_action
    render 'trash_icon' if @user.id == session[:user_id]
  end
end
