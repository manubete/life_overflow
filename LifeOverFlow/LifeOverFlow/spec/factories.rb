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
    question_title { Faker::Lorem.word}
    question_content { Faker::Lorem.sentence }
  end

  factory :answer do
    answer_content { Faker::Lorem.sentence }
    question
  end

  factory :comment do
    #hippie ipsum, just for laughs ;)
    comment_content { "Energetic exchange incense reproductive system nectar, change agent harmful electromagnetic fields massage therapist with cayenne pepper infinite blessings om seasonal." }
  end

end