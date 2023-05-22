class StatSenderJob
  include Sidekiq::Job

  def perform(user_id)
    @user = User.find_by(user_id)
    return unless user
      mail(to: user.email, subject: "Greetings, Cadet! Here are your out of this world dream stats!" )
    end
  end
end
