enable :sessions
set :session_secret, 'whatever it is'

post '/sign_up' do
	user = User.new(params[:user])
	if user.save
		@messages = ["You are now registered", "Please login to continue"]
	else
		@messages = user.errors.full_messages
	end
	erb :"static/index"
end

post '/login' do
	user = User.login(params[:user][:email], params[:user][:password])
	if user
		session[:user_id] = user.id
		redirect '/'
	else
		@messages = ["Wrong email or password"]
		erb :"static/index"
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect "/"
end

get '/users/:id' do
	@user = User.find(params[:id])
	erb :"users/profile"
end

get '/users/:id/questions' do
	@user = User.find(params[:id])
	erb :"users/user_questions"
end

get '/users/:id/answers' do
	@user = User.find(params[:id])
	erb :"users/user_answers"
end