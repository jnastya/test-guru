class FeedbacksMailer < ApplicationMailer

  def message (feedback)
    @email = feedback.email
    @message = feedback.message

    mail to: 'fomina.nst@gmail.com'
  end
end
