helpers do
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end	

	def logged_in
		!current_user.nil?
	end

	def edit_delete_question
		'<span><form action="/questions/<%= q.id %>/edit" method="get" style="width:70px"><input type="submit" value="Edit" class="btn btn-primary"></form></span><span><form action="/questions/<%= q.id %>" method="post" style="width:70px"><input type="hidden" name="_method" value="delete"><input type="submit" value="Delete" class="btn btn-danger"></form></span>'
	end

	def answer_question
		'<form action="/questions/<%= q.id %>/answers/new" method="get"><input type="submit" value="Answer this" class="btn btn-primary"></form>'
	end

	def current_position
		request.env["REQUEST_URI"]
	end

	def count_votes(type, id)
		score = 0
		object = type.capitalize.constantize.find(id)
		method_name = type + "_votes"
		object.send(method_name).each { |vote| vote.count ? score += 1 : score -= 1 }
		
		if score > 0
			return "<span style='color: green'>+#{score}</span>"
		elsif score < 0
			return "<span style='color: red'>#{score}</span>"
		else
			return "0"
		end
	end
end