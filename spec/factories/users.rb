FactoryBot.define do
  factory :user do
    email { "person@example.com" }
    password { "testpass" }
    password_digest { "testpass" }
  end
end
