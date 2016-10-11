post '/questions/:question_id/answers/:answer_id/answer_votes' do
	params.keys[0] == "Downvote" ? count = false : count = true
	@av = AnswerVote.where(user_id: current_user.id, answer_id: params[:answer_id])[0]
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
	return count_votes("answer", params[:answer_id]).to_s
	redirect "/questions/#{params[:question_id]}"
end