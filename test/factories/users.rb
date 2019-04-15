FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }

    trait :with_five_location do
      after(:create) do |user|
        5.times do
          user.locations << create(:location)
        end
      end
    end
  end
end
