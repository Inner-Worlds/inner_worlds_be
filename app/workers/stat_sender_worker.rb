
class StatSenderWorker
  include Sidekiq::Worker

  def perform
    users = User.all

    users.each do |user|
      # stats = fetch_user_stats(user)
      UserMailer.stat_email(user).deliver_now
    end
  end

  private

  # def fetch_user_stats(user)
  #   response = YourGraphqlClient.execute(UserStatsQuery, variables: { user_id: user.id })
  #   response.data.user_stats
  # end
end
