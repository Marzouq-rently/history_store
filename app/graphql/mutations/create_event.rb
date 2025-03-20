module Mutations
  class CreateEvent < Mutations::BaseMutation
    argument :event_type, String, required: true
    argument :user_id, ID, required: true
    argument :device_id, String, required: false
    argument :data, GraphQL::Types::JSON, required: false

    field :event, Types::EventType, null: false

    def resolve(event_type:, user_id:, device_id: nil, data: {})
      event = ::Event.create!(
        event_type: event_type,
        user_id: user_id,
        device_id: device_id,
        data: data
      )

      { event: event }
    end
  end
end
