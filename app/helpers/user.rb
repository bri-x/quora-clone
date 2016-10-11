helpers do
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end	

	def logged_in
		!current_user.nil?
	end

	def own_q_votes(id)
		"<span><form action><input type='submit' name='action' value='Votes | #{count_votes('question', id)}' class='btn btn-info' /></form></span>"
	end

	def edit_delete_question(id)
			"<span>
				<form action='/questions/#{id}/edit' method='get'><input type='submit' value='Edit' class='btn btn-primary'></form>
			</span>
			<span>
				<form action='/questions/#{id}' method='post'><input type='hidden' name='_method' value='delete'><input type='submit' value='Delete' class='btn btn-danger'></form>
			</span>"
	end

	def answer_question(id)
		if logged_in
			"<span><form action='/questions/#{id}/answers/new' method='get'><input type='submit' value='Answer this' class='btn btn-primary'></form></span>"
		else
			"<span><form action='/questions/#{id}/answers/new' method='get' class='need-login-form'><input type='submit' value='Answer this' class='btn btn-primary'></form></span>"
		end
	end

	def vote_question(id)
		if logged_in
			"<span><form action='/questions/#{id}/question_votes' method='post' class='voting-form'><input type='submit' name='action' value='Upvote | #{count_votes('question', id)}' class='btn btn-info' /><input type='submit' name='action' value='Downvote' class='btn btn-warning'/></form></span>"
		else
			"<span><form action='/questions/#{id}/question_votes' method='post' class='need-login-form'><input type='submit' name='action' value='Upvote | #{count_votes('question', id)}' class='btn btn-info' /><input type='submit' name='action' value='Downvote' class='btn btn-warning'/></form></span>"
		end
	end

	def edit_delete_answer(question_id, answer_id)
		"<span>
			<form action='/questions/#{question_id}/answers/#{answer_id}/edit' method='edit'><input type='submit' value='Edit' class='btn btn-default'></form>
		</span>
		<span>
		<form action='/questions/#{question_id}/answers/#{answer_id}' method='post'>
			<input type='hidden' name='_method' value='delete'>
			<input type='submit' value='Delete' class='btn btn-default'>
		</form>
		</span>"
	end

	def own_a_votes(id)
		"<span><form action><input type='submit' name='action' value='Votes | #{count_votes('answer', id)}' class='btn btn-default' /></form></span>"
	end

	def vote_answer(id)
		if logged_in
			"<span>
			<form class='voting-form' action='/questions/#{Answer.find(id).question.id}/answers/#{id}/answer_votes' method='post'>
			<input type='submit' name='action' value='Upvote | #{count_votes('answer', id)}' class='btn btn-default' />
			<input type='submit' name='action' value='Downvote' class='btn btn-default' />
			</form>
			</span>"
		else
			"<span><form class='need-login-form' action='/questions/#{Answer.find(id).question.id}/answers/#{id}/answer_votes' method='post'><input type='submit' name='action' value='Upvote | #{count_votes('answer', id)}' class='btn btn-default' /><input type='submit' name='action' value='Downvote' class='btn btn-default' /></form></span>"
		end
	end

	def tag
		all_tags = []
		count = []
		collected_tags = []
		Question.all.each { |q| all_tags << q.tag.split(', ') }
		all_tags = all_tags.flatten.uniq.sort
		
		all_tags.each do |t|
			count << Question.where('tag LIKE ?', "%#{t}%").count
		end

		count.sort.reverse.first(5).uniq.each do |n|
			index = 0
			while index
				index = count.find_index(n)
				collected_tags << all_tags[index] if index
				count[index] = nil if index
			end
		end
		return collected_tags
	end

	def current_position
		request.env["REQUEST_URI"]
	end

	def count_votes(type, id)
		score = 0
		object = type.capitalize.constantize.find(id)
		method_name = type + "_votes"
		score += object.send(method_name).where("count = ?", true).count
		score -= object.send(method_name).where("count = ?", false).count
		
		if score == 0
			return "0"
		else
			return score
		end
	end
end