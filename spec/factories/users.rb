FactoryGirl.define do

  factory :user do
    transient do
      skip_confirmation true
    end

    sequence(:email) { |n| "user#{n}@example.tld" }
    password  "testpassword"

    before(:create) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
    end

    trait :admin do
      role 'admin'
    end

  end
end


