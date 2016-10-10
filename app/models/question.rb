class Question < ActiveRecord::Base
	validates :title, presence: true
	has_many :answers
	has_many :question_votes
	belongs_to :user
end
