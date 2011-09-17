# encoding: UTF-8
require 'spec_helper'

describe Subdomain do

  it "should require a name" do
    no_name_subdomain = Factory.build(:subdomain, :name => '')
    no_name_subdomain.should_not be_valid
  end

  it "should allow for valid names" do
    names = %w[valid is-valid val 0valid123]
    names.each do |name|
      invalid_email_user = Factory.build(:subdomain, :name => name)
      invalid_email_user.should be_valid
    end
  end

  it "should reject invalid subdomain names" do
    names = %w[ftp mail ab -thing thing- wrøng wröng, 日本国]
    names.each do |name|
      invalid_email_user = Factory.build(:subdomain, :name => name)
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate subdomain names" do
    Factory(:subdomain, :name => 'test')
    sub_with_dup_name = Factory.build(:subdomain, :name => 'test')
    sub_with_dup_name.should_not be_valid
  end

end
