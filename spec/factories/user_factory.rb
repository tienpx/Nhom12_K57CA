FactoryGirl.define do
	factory :user do
		name "Alice"
		email "a@gmail.com"
		password "password"
        password_confirmation "password"

	end
end
