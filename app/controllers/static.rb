get '/' do
  if logged_in
  	@questions = Question.order(created_at: :desc).limit(25)
  	erb :"users/index"
  else
  	erb :"static/index"
  end
end