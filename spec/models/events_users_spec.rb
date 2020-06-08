require 'rails_helper'

describe EventsUser, type: :model do
  let(:event) do
    Event.create(
      title: 'Event Title',
      body: 'Event Body, hello guys',
      place: 'LA',
      date: Time.now,
      user_id: user.id
    )
  end

  let(:user) { User.create(username: 'Zack', email: 'Zack@ElMejdki.net') }
  let(:user2) { User.create(username: 'Franco', email: 'Franco@rosa.net') }

  subject { EventsUser.new(attended_event: event, attendee: user) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without valid attributes' do
    subject.attended_event = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if the foreign key was not unique' do
    EventsUser.create(attended_event: event, attendee: user)
    expect(subject).to_not be_valid
  end

  it 'is valid if the foreign key is unique' do
    EventsUser.create(attended_event: event, attendee: user2)
    expect(subject).to be_valid
  end

  it 'should belong to an attendee' do
    t = EventsUser.reflect_on_association(:attendee)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'should belong to attended_event' do
    t = EventsUser.reflect_on_association(:attended_event)
    expect(t.macro).to eq(:belongs_to)
  end
end
