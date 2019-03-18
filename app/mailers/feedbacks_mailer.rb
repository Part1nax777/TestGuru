class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def feedback_send(feedback)
    @feedback = feedback
    mail from: @feedback.name
  end

end
