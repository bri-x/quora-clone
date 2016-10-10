class CreateQuestionAnswerVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.references :question_id, index: true
			t.references :user_id, index: true
			t.boolean :count, NULL: false
			t.timestamps
		end

		create_table :answer_votes do |t|
			t.references :answer_id, index: true
			t.references :user_id, index: true
			t.boolean :count, NULL: false
			t.timestamps
		end
	end
end
