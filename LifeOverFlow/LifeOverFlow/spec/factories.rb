FactoryGirl.define do
  factory :question do
    question_content { Faker::Lorem.sentence }
  end

  # factory :answer do
  #   answer_content { Faker::Lorem.sentence }
  #   question
  # end
end