class User::SessionsController < Devise::SessionsController
  before_action :authenticate_user!

  def create
    super
    flash[:notice] = "Привет #{current_user.first_name}"
  end
end
