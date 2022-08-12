class UserNotifierMailer < ApplicationMailer
  default from: Rails.configuration.from_email

  def send_signup_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Thank you for signing up for our App"
    )
  end
end
