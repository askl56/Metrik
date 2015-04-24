FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "Test User"
    sequence :email do |n| "person#{n}@example.com" end

    password "please123"

  end

  factory :admin do
    role 'admin'
    admin true
  end

end
