class FeedbacksMailer < ApplicationMailer

  def feed_mess(email, message)
    @email = email
    @message = message

    mail to: 'fomina.nst@gmail.com'
  end
end
