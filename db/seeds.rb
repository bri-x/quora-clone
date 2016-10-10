User.create(email: "abc@gmail.com", name: "Brigitte", password:"12341234")
10.times do
	User.create(email: Faker::Internet.email, name: Faker::Name.name, password: Faker::Internet.password)
end

10.times do
	Question.create(title: Faker::Company.catch_phrase, description: Faker::Company.bs, user_id: rand(1..10))
end

50.times do
	Answer.create(text: "#{Faker::Lorem.paragraph(4)} \n #{Faker::Lorem.paragraph(3)}", user_id: rand(10), question_id: rand(1..10))
end