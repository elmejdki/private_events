require 'rails_helper'

describe Event do
  Etitle = 'Event Title'
  subject { Event.new(title: Etitle , body:'franco@rosa.net', place: "Holly Island", date: Time.now )}

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

  # it 'is valid with valid attributes' do
  #   expect(subject).to be_valid
  # end

  # it 'is not valid without a username' do
  #   subject.username = nil
  #   expect(subject).to_not be_valid
  # end

  # it 'is not valid without an email' do
  #   subject.email = nil
  #   expect(subject).to_not be_valid
  # end

  # it 'is not valid if the username is not unique' do
  #   User.create(username: 'Franco', email: 'something@gmail.com')
  #   expect(subject).to_not be_valid
  # end

  # it 'is not valid if the email is not unique' do
  #   User.create(username: 'Someoneelse', email: 'franco@rosa.net')
  #   expect(subject).to_not be_valid
  # end
  
  # it 'is valid if the username is unique' do
  #   User.create(username: 'Zack', email: 'something@gmail.com')
  #   expect(subject).to be_valid
  # end
  
  # it 'is valid if the email is unique' do
  #   User.create(username: 'Someone', email: 'zack@efrone.net')
  #   expect(subject).to be_valid
  # end
end