require 'rails_helper'
require 'session_helper'

feature 'User Account' do
	include SessionHelper
	let(:user) { FactoryGirl.create(:user) }
	let(:other_user) { FactoryGirl.create(:other_user) }
	let(:admin) { FactoryGirl.create(:admin) }

	scenario 'a new user signs up' do
		sign_up
		expect(page).to have_content('Please check your email to activate your account')
	end

	scenario 'a new user activates his account' do
		expect(user.activated?).to be false
		visit edit_account_activation_path(user.activation_token, email: user.email)
		user.reload.activated?
		expect(page).to have_content('Your account has been activated!')
	end

	scenario 'a new user has an invalid token' do
		visit edit_account_activation_path('invalid token', email: user.email)
		expect(user.reload).not_to be log_in(user)
	end

	scenario 'a new user has an invalid email' do
		visit edit_account_activation_path(user.activation_token, email: 'wrong')
		expect(user.reload).not_to be log_in(user)
	end

	scenario 'a user signs in, but has not activated his account' do
		log_in(user)
		expect(page).to have_content('Account not activated!')
	end

	scenario 'a regular user logs in' do
		log_in(other_user)
		expect(page).to have_content("You are now logged in")
		visit user_path(other_user)
		within 'h1' do
			expect(page).to have_content(other_user.first_name + ' ' + other_user.last_name)
	 	end
	end

	scenario 'a regular user logs out' do
		log_in(other_user)
		click_link 'Account'
		click_link 'Log out'
		expect(current_path).to eq root_path
		expect(page).to have_content('Bye. See you soon')
		click_link 'Log In'
	end

	scenario 'Index admin user' do
		log_in(admin)
		visit users_path
		expect(users_path).to eq('/users')
		page.has_css?('div.pagination.pagination')
		first_page_of_users = User.paginate(page: 1)
		first_page_of_users.each do |user|
		page.has_css?("td>a[href='#{user_path(user)}']", text: user.last_name)
			expect(page).to have_content('Delete a user')
	end
	end

  	scenario 'index non_admin users' do
  		log_in(other_user)
  		visit users_path
  		expect(page).not_to have_content('Delete a user')
  	end
end