post '/questions/:id/comments' do
	@question = Question.find(params[:id])
	@comment = @question.question_comments.new(params[:comment])
	@comment.user_id = current_user.id
	if @comment.save
		redirect "/questions/#{(params[:id])}"
	end
end

put '/questions/:question_id/comments/:id' do
	@comment = Comment.find(params[:id])
	@comment.update(params[:comment])
	redirect "questions/#{params[:id]}"
end

delete '/questions/:question_id/comment/:id' do
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect "questions/#{params[:id]}"
end