
class StatSenderWorker
  include Sidekiq::Worker

  def perform
    users = User.all

    users.each do |user|
      UserMailer.stat_email(user).deliver_now
    end
  end
end
