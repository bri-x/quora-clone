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
end