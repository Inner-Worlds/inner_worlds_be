module Mutations
  class StatSender < BaseMutation
    argument :id, Integer, required: true

   def resolve(user_id:)
      user = User.find(user_id)

      StatSenderJob.perform(user.id).deliver_later(wait_until: 1.week.from_now)
      { success: true }
   end
  end
end
