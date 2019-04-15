FactoryBot.define do
  factory :role do
    sequence(:name) { |n| "user-role-#{n}" }
  end
end
