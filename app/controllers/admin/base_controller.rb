class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :flash_message
  before_action :admin_required

  private

  def admin_required
    redirect_to root_path, alert: 'You are not Admin' unless current_user.admin?
  end

  def flash_message
    flash[:notice] = "Привет, администратор #{current_user.first_name}"
  end
end
