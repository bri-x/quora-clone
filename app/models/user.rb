class User < ActiveRecord::Base
	validates :name, presence:true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, presence: { on: create }, length: { minimum: 8 }
	has_secure_password

	has_many :questions
	has_many :answers

	def self.login(email, password)
		User.find_by('email = ?', email).try(:authenticate, password)
	end
end
