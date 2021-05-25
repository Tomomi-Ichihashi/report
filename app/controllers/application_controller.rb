class ApplicationController < ActionController::Base
  
  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_users_path
    when User
      user_path(current_user)
    end
  end
  
end
