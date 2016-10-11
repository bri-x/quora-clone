class AddTagsToQuestions < ActiveRecord::Migration
	def change
		add_column :questions, :tag, :string
	end
end
