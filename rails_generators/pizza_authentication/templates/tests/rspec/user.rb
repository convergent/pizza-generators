require File.dirname(__FILE__) + '/../spec_helper'

describe <%= user_class_name %> do

  context "when making a new <%= user_singular_name %>" do

    def new_<%= user_singular_name %>(attributes = {})
      Factory.build(:<%= user_singular_name %>, attributes)
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

    it "should not allow odd characters in login" do
      new_<%= user_singular_name %>(:login => 'odd ^&(@)').should have_at_least(1).error_on(:login)
    end

    it "should validate uniqueness of login" do
      new_<%= user_singular_name %>(:login => 'uniquename').save!
      new_<%= user_singular_name %>(:login => 'uniquename').should have_at_least(1).error_on(:login)
    end

    it "should require email" do
      new_<%= user_singular_name %>(:email => '').should have_at_least(1).error_on(:email)
    end

    it "should validate uniqueness of email" do
      new_<%= user_singular_name %>(:email => 'unique@email.com').save!
      new_<%= user_singular_name %>(:email => 'unique@email.com').should have_at_least(1).error_on(:email)
    end

    it "should not allow bad formatted email addresses" do
      new_<%= user_singular_name %>(:email => 'a@b').should have_at_least(1).error_on(:email)
    end

    it "should validate password is longer than 3 characters" do
      new_<%= user_singular_name %>(:password => 'bad').should have_at_least(1).error_on(:password)
    end

    it "should require matching password confirmation" do
      new_<%= user_singular_name %>(:password_confirmation => 'nonmatching').should have_at_least(1).error_on(:password)
    end

  end

  context "when editing a <%= user_singular_name %>" do

    before :each do
      @<%= user_singular_name %> = Factory(:<%= user_singular_name %>, :login => "bob", :password => "secret")
    end

    it "should not change the login" do
      lambda {
        @<%= user_singular_name.update_attributes(:login => "different")
      }.should_not change(@<%= user_singular_name %>, :login)
    end

    it "should not change the password when no old password has been entered" do
      lambda {
        @<%= user_singular_name.update_attributes(:password => "newpassword", :password_confirmation => "newpassword")
      }.should_not change(@<%= user_singular_name %>, :password)
    end

    it "should change the password when old password has been entered" do
      lambda {
        @<%= user_singular_name.update_attributes(:old_password => "secret", :password => "newpassword", :password_confirmation => "newpassword")
      }.should change(@<%= user_singular_name %>, :password)
    end

    it "should change the email when old password has been entered" do
      lambda {
        @<%= user_singular_name.update_attributes(:old_password => "secret", :email => "new@email.com")
      }.should change(@<%= user_singular_name %>, :email)
    end

    it "should not change the email when no old password has been entered" do
      lambda {
        @<%= user_singular_name.update_attributes(:email => "new@email.com")
      }.should_not change(@<%= user_singular_name %>, :email)
    end

  end

end
