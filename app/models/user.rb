class User < ActiveRecord::Base
	validates :name, presence:true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, presence: { on: create }, length: { minimum: 8 }
	has_secure_password

	def self.login(email, password)
		user = User.where('email = ?', email)[0]
		if user
			return user.authenticate(password) ? user : false
		else
			return false
		end
	end
end
