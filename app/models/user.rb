class User < ApplicationRecord
  has_many :events, dependent: :destroy

  has_many :events_users, foreign_key: :attendee_id
  has_many :attended_events, through: :events_users, source: :attended_event
end
