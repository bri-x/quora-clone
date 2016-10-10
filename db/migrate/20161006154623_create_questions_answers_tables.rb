class CreateQuestionsAnswersTables < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :title
			t.text :description
			t.timestamps
		end

		create_table :answers do |t|
			t.text :text
			t.timestamps
		end

		add_reference :questions, :user, index: true
		add_reference :answers, :user, index: true
		add_reference :answers, :question, index: true
	end
end
