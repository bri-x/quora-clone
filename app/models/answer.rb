class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :answer_votes, dependent: :destroy
	has_many :answer_comments, dependent: :destroy
end
