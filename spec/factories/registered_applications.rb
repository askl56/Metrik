FactoryGirl.define do
  factory :registered_application do
    name "MyString"
    url "MyString"
    association :user
  end
end
