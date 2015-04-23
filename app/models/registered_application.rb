class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events
end
