FactoryBot.define do
  # sequence :email do |n|
  #   "user#{n}@test.com"
  # end

  factory :user, class: "User" do
    name { FFaker::Name.unique.name }
    email { FFaker::Internet.email }
    # password { Devise.friendly_token.first 8 }
    password { '123123123' }
    password_confirmation { '123123123' }
    confirmed_at { Date.new }
  end
end
