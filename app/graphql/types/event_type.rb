module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :device_id, String, null: false
    field :event_type, String, null: false
    field :data, GraphQL::Types::JSON, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end