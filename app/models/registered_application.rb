class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events
  validates_length_of :name, :minimum => 1
  validates :name, presence: true
  validates :url, presence: true

end
