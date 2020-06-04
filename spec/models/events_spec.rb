require 'rails_helper'

describe Event do
  subject { Event.new(title: title, body: body, place: place, date: date, user_id: User.first.id) }

  let!(:user) { User.create(username: username, email: email) }

  let(:username) { 'Franco' }
  let(:email) { 'franco@rosa.net' }

  let(:title) { 'Event Title' }
  let(:body) { 'Event Body, Hello guys' }
  let(:place) { 'Los Anglos' }
  let(:date) { Time.now }
  let(:user_id) { user.id }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_length_of(:title).is_at_least(10).is_at_most(25) }
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_least(20).is_at_most(200) }
  it { should validate_presence_of(:place) }
  it { should validate_length_of(:place).is_at_least(2).is_at_most(20) }
  it { should validate_presence_of(:date) }
  it { should belong_to(:creator) }
  it { should have_many(:events_users) }
  it { should have_many(:attendees) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with nil values' do
    subject.title = nil
    subject.place = nil
    subject.body = nil
    subject.place = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if the title is not unique' do
    Event.create(title: 'Event Title', body: body, place: place, date: date, user_id: User.first.id)
    expect(subject).to_not be_valid
  end

  it 'is not valid if the title is not unique' do
    Event.create(title: 'Event 2 Title', body: body, place: place, date: date, user_id: User.first.id)
    expect(subject).to be_valid
  end
end
