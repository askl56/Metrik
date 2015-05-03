class Event < ActiveRecord::Base
  belongs_to :registered_application
  validates :name, presence: true
  serialize :meta, Hash
end
