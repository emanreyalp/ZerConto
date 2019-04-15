FactoryBot.define do
  factory :location do
    address { 'nowhere str. 4' }
    city { 'Very Far' }
    zip_code { 'VF-1234' }
    country
  end
end
