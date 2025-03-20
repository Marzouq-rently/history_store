class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  VALID_EVENT_TYPES = %w[click Favourite waitlist].freeze
  VALID_DATA_KEYS = %w[source device propertyId].freeze


  field :user_id, type: BSON::ObjectId
  field :device_id, type: String
  field :event_type, type: String
  field :data, type: Hash

  validates :event_type, presence: true, inclusion: { in: VALID_EVENT_TYPES }
  validate :validate_data_keys
  
  private

  def validate_data_keys
    if data.is_a?(Hash)
      invalid_keys = data.keys - VALID_DATA_KEYS
      errors.add(:data, "contains invalid keys: #{invalid_keys.join(', ')}") if invalid_keys.any?
    else
      errors.add(:data, "must be a hash")
    end
  end
end
