class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true 
	#validates_presence_of :name, :messages => "Fill it"
	validates :email, presence: true
    validates :password, presence: true
	validates :password_confirmation, presence: true
	#validates_presence_of :password, :messages => "Fill it"
end
