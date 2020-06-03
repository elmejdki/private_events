require 'rails_helper'

describe 'Flash Notices for sign in', js:true do
  let( :correct_username ) { 'Zack' }
  let( :wrong_username ) { 'nothing' }

  before do
    visit '/users/sign_in'
  end

  it 'user can\'t log in' do
    fill_in 'Username', with: wrong_username
    click_button 'Log in'

    expect(page).to have_content('Wrong Username, sorry you are not allowed to enter.')
  end

  it 'user logged in succefully' do
    fill_in 'Username', with: correct_username
    click_button 'Log in'


    expect(page).to have_content('You signed in successfully.')
  end
end