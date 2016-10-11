# User.create(email: "abc@gmail.com", name: "Brigitte", password:"12341234")
# 10.times do
# 	User.create(email: Faker::Internet.email, name: Faker::Name.name, password: Faker::Internet.password)
# end

# 50.times do
# 	title = ["Who is ", "What is ", "How do you "]
# 	faker = [Faker::Name.name + "?", Faker::Company.profession + "?", Faker::Hacker.verb + " " + Faker::Hacker.noun + "?"]
# 	num = rand(0..2)
# 	Question.create(title: title[num] + faker[num], description: Faker::Company.bs, user_id: rand(1..10))
# end

200.times do
	Answer.create(text: "#{Faker::Hipster.paragraph} \n #{Faker::Hipster.paragraph}", user_id: rand(1..10), question_id: rand(50..70))
end

100.times do
	AnswerComment.create(text: Faker::Hipster.sentence, user_id: rand(1..10), answer_id: rand(253..453))
	QuestionComment.create(text: Faker::Hipster.sentence, user_id: rand(1..10), question_id: rand(50..70))
end