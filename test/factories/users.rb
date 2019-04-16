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

    trait :with_superior do
      association :superior, factory: :user
    end

    trait :with_employee do
      after(:create) do |user|
        user.employees << create(:user)
      end
    end
  end
end
