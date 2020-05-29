class Event < ApplicationRecord
  has_many :events_users, foreign_key: :attendee_id
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendees, through: :events_users, source: :attendee
  #has_and_belongs_to_many :attendees, class_name: 'User', foreign_key: :user_id
end
