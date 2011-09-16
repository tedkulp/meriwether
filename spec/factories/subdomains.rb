FactoryGirl.define do
  factory :subdomain do
    name "test"
    after_create { |n| n.created_by = Factory(:user, :subdomain => n) }
  end
end
