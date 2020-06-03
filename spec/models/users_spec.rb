require 'rails_helper'

describe User do
  subject { User.new(username: 'Franco', email:'franco@rosa.net' )}

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:username).is_at_least(3).is_at_most(20) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(10).is_at_most(40) }
  it { should have_many(:events) }
  it { should have_many(:attended_events) }
  it { should have_many(:events_users) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if the username is not unique' do
    User.create(username: 'Franco', email: 'something@gmail.com')
    expect(subject).to_not be_valid
  end

  it 'is not valid if the email is not unique' do
    User.create(username: 'Someoneelse', email: 'franco@rosa.net')
    expect(subject).to_not be_valid
  end
  
  it 'is valid if the username is unique' do
    User.create(username: 'Zack', email: 'something@gmail.com')
    expect(subject).to be_valid
  end
  
  it 'is valid if the email is unique' do
    User.create(username: 'Someone', email: 'zack@efrone.net')
    expect(subject).to be_valid
  end
end