class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Email verification at AppTracker.club')
  end

  def notification_email(user)
    @user = user
    mail(to: @user.email, subject: 'Major changes in tracked apps')
  end
end
