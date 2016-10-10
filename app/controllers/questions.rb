get '/questions/new' do
	erb :"questions/new"
end

post '/questions' do
	@question = Question.new(params[:question])
	@question.user_id = current_user.id
	byebug
	if @question.save
		redirect '/'
	else
		@messages = @question.errors.full_messages
		erb :"questions/new"
	end
end

get '/questions' do
	@questions = Question.order(created_at: :desc).limit(25)
	erb :"users/index"
end

get '/unanswered' do
	@questions = Question.where('answered = false')
	erb :"users/index"
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :"questions/show"
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"questions/edit"
end

put '/questions/:id' do
	@question = Question.find(params[:id])
	if params[:question][:title] == ""
		@question.description = params[:question][:description]
		@question.save
	else
		@question.update(params[:question])	
	end
	redirect "/questions/#{params[:id]}"
end

delete '/questions/:id' do
	@question = Question.find(params[:id])
	@question.destroy
	redirect '/'
end