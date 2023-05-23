require "sidekiq-scheduler"

class StatSenderWorker
  include Sidekiq::Worker

  def perform(user_id)
    @user = User.find_by_id(user_id)
    return unless @user

    @user_stats = fetch_user_stats(@user)

    UserMailer.stat_email(@user, @user_stats).deliver_now
  end

  private

  def fetch_user_stats(user)
    require 'pry'; binding.pry
    response = YourGraphqlClient.execute(UserQuery, variables: { id: user.id })
    response.data.user
  end
end
