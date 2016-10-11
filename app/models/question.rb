class Question < ActiveRecord::Base
	validates :title, presence: true
	has_many :answers, dependent: :destroy
	has_many :question_votes, dependent: :destroy
	has_many :question_comments, dependent: :destroy
	belongs_to :user
end
