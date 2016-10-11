post '/questions/:id/question_votes' do
	params.keys[0] == "Downvote" ? count = false : count = true
	@qv = QuestionVote.where(user_id: current_user.id, question_id: params[:id])[0]
	if @qv
		if @qv.count == count
		else
			@qv2 = QuestionVote.new(user_id: current_user.id, question_id: params[:id], count: count)
			@qv2.save
		end
		@qv.destroy
	else
		@qv = QuestionVote.new(user_id: current_user.id, question_id: params[:id], count: count)
		@qv.save
	end
	return count_votes("question", params[:id]).to_s
	redirect "/questions/#{params[:id]}"
end