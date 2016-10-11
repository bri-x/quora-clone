require_relative '20161010101913_create_question_answer_votes'

class FixupCreateQuestionAnswerVotes < ActiveRecord::Migration
	def change
		revert CreateQuestionAnswerVotes

		create_table :question_votes do |t|
			t.references :question, index: true, foreign_key: {on_delete: :cascade}
			t.references :user, index: true
			t.boolean :count, NULL: false
			t.timestamps
		end

		create_table :answer_votes do |t|
			t.references :answer, index: true, foreign_key: {on_delete: :cascade}
			t.references :user, index: true
			t.boolean :count, NULL: false
			t.timestamps
		end
	end
end
