class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_and_belongs_to_many :attended_events, class_name: 'Event', foreign_key: :event_id
end
