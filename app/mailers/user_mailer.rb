class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_user.subject
  #
  def contact_user message
    @message = message

    # mail to: message.user.email, subject: message.subject
    mail to: message.subject, subject: message.subject
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.apply_job.subject
  #
  def apply_job user
    @user = user

    mail to: "ducnguyen272727@gmail.com", subject: "Thông báo của việc làm 360"
  end
end
