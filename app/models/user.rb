class User < ApplicationRecord
  has_many :events, dependent: :destroy

  has_many :events_users, foreign_key: :attendee_id
  has_many :attended_events, through: :events_users, source: :attended_event

  validates :username, length: { in: 3..20 }, presence: true, uniqueness: true
  validates :email, presence: true, length: { in: 10..40 }, uniqueness: true
end
