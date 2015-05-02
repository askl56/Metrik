class EventSerializer < ActiveModel::Serializer
  attributes :id
  cache key: 'event', expires_in: 3.hours
end
