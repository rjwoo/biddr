FactoryGirl.define do
  factory :auction do
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}" }
    detail           { Faker::Lorem.paragraph         }
    end_date         60.days.from_now
    reserve_price    { 10 + rand(100000)              }
  end
end
