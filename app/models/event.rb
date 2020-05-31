class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :events_users, foreign_key: :attended_event_id
  has_many :attendees, through: :events_users, source: :attendee
end
