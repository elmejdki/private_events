require 'rails_helper'

describe EventsUser, type: :model do
  let(:event) { Event.create( title: 'Event Title', body: 'Event Body, hello guys', place: 'LA', date: Time.now, user_id: user.id ) }
  let(:user) { User.create( username: 'Zack', email: 'Zack@ElMejdki.net' ) }
  let(:user2) { User.create( username: 'Franco', email: 'Franco@rosa.net' ) }

  subject { EventsUser.new( attended_event: event, attendee: user )}

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without valid attributes' do
    subject.attended_event = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if the foreign key was not unique' do
    EventsUser.create(attended_event: event, attendee: user2)
    expect(subject).to be_valid
  end

  # it 'is not valid if the foreign key pair is not unique' do
  #   EventAttendance.create(attended_event: event, guest: user, accepted: nil)
  #   expect(subject).to_not be_valid
  # end

  # it 'should belong to guest' do
  #   t = EventAttendance.reflect_on_association(:guest)
  #   expect(t.macro).to eq(:belongs_to)
  # end

  # it 'should belong to attended_event' do
  #   t = EventAttendance.reflect_on_association(:attended_event)
  #   expect(t.macro).to eq(:belongs_to)
  # end
end