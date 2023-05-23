module Mutations
  class StatSender < BaseMutation
    argument :id, Integer, required: true

   def resolve(user_id:)
      user = User.find_by(id: user_id)

      StatSenderWorker.perform_async(user.id) if user
      { success: true }
   end
  end
end
