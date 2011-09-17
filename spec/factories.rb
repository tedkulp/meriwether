saved_single_instances = {}
#Find or create the model instance
single_instances = lambda do |factory_key, attributes|
  begin
    saved_single_instances[factory_key].reload
  rescue
    #was never created (is nil) or was cleared from db
    attributes = {} if attributes.nil?
    saved_single_instances[factory_key] = Factory.create(factory_key, attributes)  #recreate
  end

  return saved_single_instances[factory_key]
end

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :subdomain_name do |n|
    "test#{n}"
  end

  factory :user do
    email { Factory.next(:email) }
    password 'please'
    subdomain { single_instances[:subdomain, {}] }

    factory :subdomain_owner do
    end
  end

  factory :subdomain do
    name { Factory.next(:subdomain_name) }
    #created_by { single_instances[:subdomain_owner] }
    after_build{ |n| n.created_by = single_instances[:subdomain_owner, :subdomain => n] }
  end
end
