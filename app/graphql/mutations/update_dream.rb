module Mutations
  class UpdateDream < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :lucidity, Integer, required: false

    type Types::DreamType

    def resolve(**attributes)
      dream = Dream.find(attributes[:id])
      if dream.update!(attributes)
        dream
      else
        raise GraphQL::ExecutionError, "Dream not found"
      end
    end
  end
end