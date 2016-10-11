get '/questions/:id/answers/new' do
	@question = Question.find(params[:id])
	erb :'answers/new'
end

post '/questions/:id/answers' do
	@question = Question.find(params[:id])
	@answer = @question.answers.new(params[:answer])
	@answer.user_id = current_user.id
	if @answer.save
		@question.answered = true
		redirect "/questions/#{(params[:id])}"
	else
		@messages = @answer.errors.full_messages
		erb :'answers/new'
	end
end

get '/questions/:id/answers/:answer_id/edit' do
	@answer = Answer.find(params[:answer_id])
	erb :'answers/edit'
end

put '/questions/:id/answers/:answer_id' do
	@answer = Answer.find(params[:answer_id])
	@answer.update(params[:answer])
	redirect "questions/#{params[:id]}"
end

delete '/questions/:id/answers/:answer_id' do
	@answer = Answer.find(params[:answer_id])
	@answer.destroy
	redirect "questions/#{params[:id]}"
end