require 'rails_helper'
require 'session_helper'

feature 'User Account' do
	include SessionHelper
	let(:admin) { FactoryGirl.create(:user) }
	let(:non_admin) { FactoryGirl.create(:other_user) }

	scenario 'a new user signs up' do
		sign_up
		expect(page).to have_content('User created successfully')
	end

	scenario 'registered user logs in' do
		log_in(admin)
		expect(page).to have_content("You are now logged in")
		expect(current_path).to eq user_path(admin)
		within 'h1' do
		expect(page).to have_content(admin.first_name + ' ' + admin.last_name)
	end
end

	scenario 'user logs out' do
		log_in(admin)
		click_link 'Account'
		click_link 'Log out'
		expect(current_path).to eq root_path
		expect(page).to have_content('Bye. See you soon')
		click_link 'Log In'
		#save_and_open_page
	end

	scenario 'index admin user' do
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
  		log_in(non_admin)
  		visit users_path
  		expect(page).not_to have_content('Delete a user')
  	end

end
