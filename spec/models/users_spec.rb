require 'rails_helper'

describe User do
  subject { User.new(username: 'franco', email:'franco@rosa.net' )}

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

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
    User.create(username: 'franco', email: 'something@gmail.com')
    expect(subject).to_not be_valid
  end

  # it 'is not valid if the email is not unique' do
  #   User.create(username: 'Franco', email: 'zack@efrone.net')
  #   expect(subject).to_not be_valid
  # end
  
  # it 'is valid if the username is unique' do
  #   User.create(username: 'Zack', email: 'something@gmail.com')
  #   subject.username = 'Franco'
  #   expect(subject).to be_valid
  # end
  
  # it 'is valid if the username is unique' do
  #   User.create(username: 'Franco', email: 'zack@efrone.net')
  #   subject.email = 'Franco@gmail.com'
  #   expect(subject).to be_valid
  # end
end