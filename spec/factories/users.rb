FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email { Factory.next(:email) }
    password 'please'
    after_create { |n| n.subdomain = Factory(:subdomain) }
  end
end
