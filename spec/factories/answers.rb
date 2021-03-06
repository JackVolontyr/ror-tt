FactoryBot.define do
  factory :answer, class: "Answer" do
    body { "MyABody" }
    question
    user
  end

  factory :invalid_answer, class: "Answer" do
    body { nil }
  end
end