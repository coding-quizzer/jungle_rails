module UsersHelper
  def current_user
   User.find(session[:user_id]) if session[:user_id]
  end

  def user_full_name
    current_user && "#{current_user.first_name} #{current_user.last_name}" 
  end

  def displayed_user_name
    user_full_name || "Khurram Virani"
  end

  def displayed_user_email
    (current_user && current_user.email) || 'kvirani@gmail.com'
  end


end
