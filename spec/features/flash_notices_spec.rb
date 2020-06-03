require 'rails_helper'

describe 'Flash Notices for sign in', js:true do
  let!(:user) { User.create(username: username, email: email) }
  let(:email) { 'Zack@gmail.com' }
  let(:username) { 'Zack' }
  let(:wrong_username) { 'nothing' }

  before do
    visit users_sign_in_path
  end

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