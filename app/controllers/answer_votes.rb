post '/questions/:id/answers/:answer_id/answer_votes' do
	params[:action] == "Downvote" ? count = false : count = true
	@av = AnswerVote.where('user_id = ? AND answer_id = ?', current_user.id, params[:answer_id])[0]
	if @av
		if @av.count == count
		else
			@av2 = AnswerVote.new(user_id: current_user.id, answer_id: params[:answer_id], count: count)
			@av2.save
		end
		@av.destroy
	else
		@av = AnswerVote.new(user_id: current_user.id, answer_id: params[:answer_id], count: count)
		@av.save
	end
	redirect "/questions/#{params[:id]}"
end