FactoryGirl.define do
  factory :user do
  	first_name 'John'
  	last_name 'Doe'
  	email 'john@example.com'
  	password 'foobar'
  	password_confirmation 'foobar'

  factory :other_user do
    first_name 'Jane'
    last_name 'Gordon'
    email 'jgordon@example.com'
    password 'foobar'
    password_confirmation 'foobar'

  factory :invalid_user do
  	first_name 'J'
  	last_name 'Doe'
  	email 'john_at_example'
  	password 'foo'
  	password_confirmation 'foo'
  end
end
end
end