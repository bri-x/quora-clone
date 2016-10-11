get '/' do
  if logged_in
  	@questions = Question.order('created_at DESC').page(params[:page])
  	erb :"users/index"
  else
  	erb :"static/index"
  end
end