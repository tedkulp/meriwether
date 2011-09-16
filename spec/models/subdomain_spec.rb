require 'spec_helper'

describe Subdomain do

  it "should require a name" do
    no_name_subdomain = Factory.build(:subdomain, :name => '')
    no_name_subdomain.should_not be_valid
  end

  it "should reject duplicate subdomain names" do
    Factory(:subdomain)
    sub_with_dup_name = Factory.build(:subdomain)
    sub_with_dup_name.should_not be_valid
  end

end
