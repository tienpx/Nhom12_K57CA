FactoryGirl.define do
	factory :user do
		password "password"
    	password_confirmation "password"
        name "Alice"
		email "a@gmail.com"
	end
end
