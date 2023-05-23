class UserMailer < ApplicationMailer
  def stat_email(user)
    @user = user
    mail(to: @user.email, subject: "Greetings, Cadet! Here are your out of this world dream stats!" )
  end
end