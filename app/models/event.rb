class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :events_users, foreign_key: :attended_event_id
  has_many :attendees, through: :events_users, source: :attendee

  scope :past, -> { where('date < ?', Time.now) }
  scope :upcoming, -> { where('date >= ?', Time.now) }

  validates :title, length: { minimum: 10 }, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 20 }
  validates :place, presence: true, length: { minimum: 2 }
  validates :date, presence: true
end
