module Queries
  class Events < Queries::BaseQuery
    type [Types::EventType], null: false

    argument :event_type, String, required: false
    argument :user_id, ID, required: false
    argument :device_id, String, required: false
    argument :data_key, String, required: false
    argument :data_value, GraphQL::Types::JSON, required: false

    def resolve(event_type: nil, user_id: nil, device_id: nil, data_key: nil, data_value: nil)
      query = Event.all
      query = query.where(event_type: event_type) if event_type.present?
      query = query.where(user_id: user_id) if user_id.present?
      query = query.where(device_id: device_id) if device_id.present?
      # query = query.where('data.property_id' => property_id) if property_id.present?

      # Dynamic query inside the `data` field
      if data_key.present? && data_value.present?
        query = query.where("data.#{data_key}" => data_value)
      end

      query
    end
  end
end
