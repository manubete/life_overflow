FactoryGirl.define do
  factory :question do
    question_content { Faker::Lorem.sentence }
  end

  factory :user do
    username { "ashwizzle24" }
    email { "ash.nkumar@gmail.com" }
    password { "ashwin" }
  end

  factory :session do
    id { }
  end
end