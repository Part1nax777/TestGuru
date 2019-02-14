class AnswersController < ApplicationController
  before_action :authenticate_user!

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
