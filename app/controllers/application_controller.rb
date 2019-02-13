class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    if user.is_a?(Admin)
      flash[:notice] = "Привет #{current_user.first_name}"
      admin_tests_path
    else
      flash[:notice] = "Привет #{current_user.first_name}"
      super
    end
  end
end
