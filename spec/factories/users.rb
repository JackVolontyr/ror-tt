FactoryBot.define do
  factory :user, class: "User" do
    name { FFaker::Name.unique.name }
    email { FFaker::Internet.email }
    password { Devise.friendly_token.first 8 }
  end
end
