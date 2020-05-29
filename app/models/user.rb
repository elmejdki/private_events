class User < ApplicationRecord
  has_many :events_users, foreign_key: :attended_event_id
  has_many :events, dependent: :destroy
  has_many :attended_events, through: :events_users, source: :attended_event
  #has_and_belongs_to_many :attended_events, class_name: 'Event', foreign_key: :event_id
end
