require File.dirname(__FILE__) + '/../spec_helper'

describe <%= user_class_name %> do

  def new_<%= user_singular_name %>(attributes = {})
    attributes[:login] ||= 'foo'
    attributes[:password] ||= 'abc123'
    attributes[:password_confirmation] ||= attributes[:password]
    <%= user_class_name %>.new(attributes)
  end

  before(:each) do
    <%= user_class_name %>.delete_all
  end

  it "should be valid" do
    new_<%= user_singular_name %>.should be_valid
  end

  it "should require login" do
    new_<%= user_singular_name %>(:login => '').should have_at_least(1).error_on(:login)
  end

  it "should require password" do
    new_<%= user_singular_name %>(:password => '').should have_at_least(1).error_on(:password)
  end

  it "should validate uniqueness of login" do
    new_<%= user_singular_name %>(:login => 'uniquename').save!
    new_<%= user_singular_name %>(:login => 'uniquename').should have_at_least(1).error_on(:login)
  end

  it "should not allow odd characters in login" do
    new_<%= user_singular_name %>(:login => 'odd ^&(@)').should have_at_least(1).error_on(:login)
  end

  it "should validate password is longer than 3 characters" do
    new_<%= user_singular_name %>(:password => 'bad').should have_at_least(1).error_on(:password)
  end

  it "should require matching password confirmation" do
    new_<%= user_singular_name %>(:password_confirmation => 'nonmatching').should have_at_least(1).error_on(:password)
  end

end
