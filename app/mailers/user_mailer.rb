class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Email verification at AppTracker.club')
  end

  def notification_email(user)
    @user = user
    attachments.inline['download_icon.png'] = File.read(Rails.root.join('app', 'assets', 'icons', 'download_icon.png'))
    attachments.inline['star_icon.png'] = File.read(Rails.root.join('app', 'assets', 'icons', 'star_icon.png'))
    attachments.inline['trending_down_icon.png'] = File.read(Rails.root.join('app', 'assets', 'icons', 'trending_down_icon.png'))
    attachments.inline['trending_up_icon.png'] = File.read(Rails.root.join('app', 'assets', 'icons', 'trending_up_icon.png'))

    mail(to: @user.email, subject: 'Major changes in tracked apps')
  end
end
