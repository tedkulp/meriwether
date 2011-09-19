Given /^I visit subdomain (.+)$/ do |sub|
  Capybara.default_host = "#{sub}.example.com"
  Capybara.app_host = "http://#{sub}.example.com:9887" if Capybara.current_driver == :culerity
end

Given /^subdomain (.+) is valid$/ do |sub|
  Factory(:subdomain, :name => sub)
end

When /^I request page (.*)$/ do |page|
  get 'http://' + Capybara.default_host + page
end

Then /^I should get a (\d+) error$/ do |error|
  assert last_response.status.to_s == error.to_s
end

Then /^I should get a valid page$/ do
  assert last_response.ok?
end
