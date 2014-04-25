FactoryGirl.define do


  factory :user do
    username { "ashwizzle24" }
    email { "ash.nkumar@gmail.com" }
    password { "ashwin" }
  end

  factory :session do
    id { }
  end

  factory :question do
    question_content { Faker::Lorem.sentence }
  end

  factory :answer do
    answer_content { Faker::Lorem.sentence }
    question
  end

end