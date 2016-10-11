class User < ActiveRecord::Base
	validates :name, presence:true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, presence: { on: create }, length: { minimum: 8 }
	has_secure_password

	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :answer_votes, dependent: :destroy
	has_many :question_votes, dependent: :destroy
	has_many :question_comments, dependent: :destroy
	has_many :answer_comments, dependent: :destroy

	def self.login(email, password)
		User.find_by('email = ?', email).try(:authenticate, password)
	end
end
