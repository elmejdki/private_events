require 'rails_helper'

describe 'Flash Notices for sign in', js:true do
  let!(:user) { User.create(username: username, email: email) }
  let!(:second_user) { User.create(username: username + 'fs', email: email + 'fdsf') }
  let(:email) { 'Zack@gmail.com' }
  let(:username) { 'Zack' }
  let(:wrong_username) { 'nothing' }

  before do
    visit users_sign_in_path
  end

  context 'Unsigned in user' do
    it 'user can\'t log in' do
      fill_in 'Username', with: wrong_username
      click_button 'Log in'
      expect(page).to have_content('Wrong Username, sorry you are not allowed to enter.')
    end

    it 'user logged in succefully' do
      fill_in 'Username', with: username
      click_button 'Log in'
      expect(page).to have_content('You signed in successfully.')
    end
  
    it 'sign up a user successfuly' do
      visit new_user_path
      fill_in 'Username', with: 'newuser'
      fill_in 'Email', with: 'newuser@gmail.com'
      click_button 'Sign up'
      expect(page).to have_content('You have successfuly signed up.')
    end
  end
  
  context 'Signed in user' do
    let!(:event) { User.first.events.create(
      title: 'Event Title',
      body: body,
      place: place,
      date: date
    ) }
    let(:title) { 'Test Event' }
    let(:body) { 'Test Event for testing purposes' }
    let(:place) { 'Far away' }
    let(:date) { Time.now }

    before do
      fill_in 'Username', with: username
      click_button 'Log in'
    end
    
    it 'sign out successfuly' do
      within('.navbar') do
        click_link 'Sign Out'
      end
      expect(page).to have_content('You signed out, see you later man')
    end
    
    it 'create event successfully' do
      within('.navbar') do
        click_link 'My Events'
      end
      click_link 'Create a new event'

      fill_in 'Title', with: title
      fill_in 'Body', with: body
      fill_in 'Place', with: place
      fill_in 'Date', with: date

      click_button 'Create Event'
      expect(page).to have_content('A new event was created successfuly')
    end

    it 'create event successfully' do
      within('.navbar') do
        click_link 'All Events'
      end

      within('.box') do
        click_link 'Show'
      end

      click_button 'invite user'
      expect(page).to have_content('user was invited to the event successfully')
    end    
  end
end