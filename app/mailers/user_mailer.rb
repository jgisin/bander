class UserMailer < ApplicationMailer
  default from: 'kitlangton@gmail.com'

  def band_invite_email(email, invite)
    @invite = invite
    mail(to: email, subject: "You've been invited to join #{@invite.band.name}!")
  end
end
