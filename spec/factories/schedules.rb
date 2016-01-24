require 'Faker'

FactoryGirl.define do
  factory :schedule do
    week { Faker::Number.digit}
    weekday 1
    start_time { Faker::Time.between(DateTime.now - 6, DateTime.now) }
    end_time { Faker::Time.between(DateTime.now, 2.days.from_now ) }

    factory :invalid_schedule do
      week nil
    end
  end

end
