# frozen_string_literal: true

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
      if attributes[:dream_date]
        attributes[:dream_date] = if attributes[:dream_date].include?('-')
                                    DateTime.strptime(attributes[:dream_date], '%Y-%m-%d')
                                  else
                                    DateTime.strptime(attributes[:dream_date], '%m/%d/%Y')
                                  end
      end
      dream.update!(attributes)
      dream
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
