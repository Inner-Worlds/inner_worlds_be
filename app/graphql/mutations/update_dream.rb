module Mutations
  class UpdateDream < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :lucidity, Integer, required: false

    type Types::DreamType

    def resolve(**attributes)
      dream = Dream.find(attributes[:id].to_i)
      dream.update!(attributes)
      dream
      rescue ActiveRecord::RecordInvalid => exception
      GraphQL::ExecutionError.new("Invalid input: #{exception.record.errors.full_messages.join(', ')}")
    end
  end
end