FactoryBot.define do
  factory :question, class: "Question" do
    title { "MyString" }
    body { "MyText" }
    user
  end

  factory :invalid_question, class: "Question" do
    title { nil }
    body { nil }
    user { nil }
  end
end