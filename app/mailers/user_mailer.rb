class UserMailer < ApplicationMailer
  def stat_email(user, user_stats)
    @user = user
    @user_stats = user_stats
    mail(to: @user.email, subject: "Greetings, Cadet! Here are your out of this world dream stats!" )
  end
end