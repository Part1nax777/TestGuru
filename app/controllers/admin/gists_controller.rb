class Admin::GistsController < Admin::BaseController
    before_action :find_gist, only: %i[show destroy]

  def index
    @gists = Gist.all
  end

  def show
    redirect_to admin_question_path(@gist.question)
  end

  def destroy
    @gist.destroy
    redirect_to admin_gists_path
  end

  private

  def find_gist
    @gists = Gist.find(params[:id])
  end
end
