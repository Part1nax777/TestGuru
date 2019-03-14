class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.feedback_send(@feedback).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      render :new, notice: t('.unsuccess')
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :message)
  end
end
