post '/questions/:question_id/answers/:id/comments' do
	@answer = Answer.find(params[:id])
	@comment = @answer.answer_comments.new(params[:comment])
	@comment.user_id = current_user.id
	if @comment.save
		redirect "/questions/#{params[:question_id]}"
	end
end

put '/questions/:question_id/answers/:answer_id/comments/:id' do
	@comment = Comment.find(params[:id])
	@comment.update(params[:comment])
	redirect "questions/#{params[:question_id]}"
end

delete '/questions/:question_id/answers/:answer_id/comment/:id' do
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect "questions/#{params[:question_id]}"
end