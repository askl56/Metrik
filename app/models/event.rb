class Event < ActiveRecord::Base
  belongs_to :registered_application
  validates :name, presence: true, uniqueness: true
end
