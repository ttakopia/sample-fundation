User.create!(first_name: 'shohei',
    		last_name: 'kihara',
    		email: 'shohei@examplea.com',
    		password: 'foobar',
    		password_confirmation: 'foobar',
    		admin: true)

99.times do |n|
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = "test-#{n+1}@example.com"
	password = 'password'
	User.create!(first_name: first_name,
				 last_name: last_name,
				 email: email,
				 password: password,
				 password_confirmation: password )
end