require 'rails_helper'

describe 'User Sessions' do
  let!(:user) { User.create(username: username, email: email) }
  let(:username) { 'Zack' }
  let(:email) { 'Zack@Efrone.net' }

  before do
    visit users_sign_in_path
  end

  context 'user unsigned in' do
    before do
      fill_in 'Username', with: ''
      click_button 'Log in'
    end

    it 'displays an error message' do
      expect(page).to have_content('Wrong Username, sorry you are not allowed to enter.')
    end

    
    it 'shows the correct menu links' do
      within('.navbar') do
        sleep(5)
        expect(page).to have_link('Sign In')
        expect(page).to have_link('Sign up')
        expect(page).to_not have_link('My Events')
        expect(page).to_not have_link('Users')
        expect(page).to_not have_link('All Events')
        expect(page).to_not have_link('Sign Out')
      end
    end
  end

  context 'user signed in' do
    before do
      puts User.all.inspect
      fill_in 'Username', with: 'Zack'
      
      click_button 'Log in'
      
    end

    it 'displays a welcome message' do
      expect(page).to have_content('You signed in successfully.')
      
    end

    it 'shows the correct menu links' do
      within('.navbar') do
        expect(page).to have_link('My Events')
        expect(page).to have_link('Users')
        expect(page).to have_link('All Events')
        expect(page).to have_link('Sign Out')
        expect(page).to_not have_link('Sign in')
        expect(page).to_not have_link('Sign up')
      end
    end
  end
end