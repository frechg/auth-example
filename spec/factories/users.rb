FactoryBot.define do
  factory :user do
    email { "person@example.com" }
    password_digest { "testpass" }
  end
end
