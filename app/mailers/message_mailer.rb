class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message.subject
  #
  def message_mail(message)
    @greeting = "Hey!"
    @message = message

    mail to: @message.to, from: @message.from, subject: @message.subject
  end
end


