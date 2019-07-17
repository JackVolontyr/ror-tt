FactoryBot.define do
  factory :question, class: "Question" do
    title { "MyQTitle" }
    body { "MyQBody" }
    user
  end

  factory :invalid_question, class: "Question" do
    title { nil }
    body { nil }
    user { nil }
  end
end
