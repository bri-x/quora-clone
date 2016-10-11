class CreateCommentsTable < ActiveRecord::Migration
	def change
		create_table :answer_comments do |t|
			t.text :text
			t.references :user, index: true
			t.references :answer, index: true
			t.timestamps
		end

		create_table :question_comments do |t|
			t.text :text
			t.references :user, index: true
			t.references :question, index: true
			t.timestamps
		end
	end
end
