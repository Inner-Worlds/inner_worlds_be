module Mutations
  class UpdateDream < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :lucidity, Integer, required: false
    argument :dream_date, String, required: false

    type Types::DreamType

    def resolve(**attributes)
      dream = Dream.find(attributes[:id])
      # require 'pry'; binding.pry
      attributes[:dream_date] = DateTime.strptime(attributes[:dream_date], '%m/%d/%Y') if attributes[:dream_date]
      dream.update!(attributes)
      dream
    rescue ActiveRecord::RecordInvalid => exception
      GraphQL::ExecutionError.new("Invalid input: #{exception.record.errors.full_messages.join(', ')}")
    end
  end
end