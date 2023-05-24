class UserMailer < ApplicationMailer
  def stat_email(user)
    @user = user
    mail(to: @user.email, subject: "Inner Worlds - Your out of this world dream stats!" )
  end
end