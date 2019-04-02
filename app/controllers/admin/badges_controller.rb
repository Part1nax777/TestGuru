class Admin::BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge, only: %i[show destroy edit update]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save!
      redirect_to admin_badges_path, notice: "Награда создана"
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: "Награда успешно обновлена"
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: "Награда успешно удалена"
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :badge_url, :rule, :rule_params)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
