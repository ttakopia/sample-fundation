require 'rails_helper'
require 'session_helper'

feature 'User Account' do
	include SessionHelper
	let(:user) { FactoryGirl.create(:user) }

	scenario 'a new user signs up' do
		sign_up
		expect(page).to have_content('User created successfully')
	end

	scenario 'registered user logs in' do
		log_in
		expect(page).to have_content("You are now logged in")
		expect(current_path).to eq user_path(user)
		within 'h1' do
		expect(page).to have_content(user.first_name + ' ' + user.last_name)
	end
end

	scenario 'user logs out' do
		log_in
		click_link 'Account'
		click_link 'Log out'
		expect(current_path).to eq root_path
		expect(page).to have_content('Bye. See you soon')
		click_link 'Log In'
		#save_and_open_page
	end
end
