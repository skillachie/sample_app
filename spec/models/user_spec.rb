require 'spec_helper'

describe User do

	before(:each) do
		@attr = { :name => "Dwayne", :email => "dwayne@gmail.com" }
	end

	it "Create new instance" do
		User.create!(@attr)
	end

	it "should require a name" do
		no_name_user = User.new(@attr.merge(:name => ""))
		no_name_user.should_not be_valid
	end

	it "should require a email" do
		no_email_user = User.new(@attr.merge(:email => ""))
		no_email_user.should_not be_valid
	end

	it "Should reject long names" do
		long_name = "d"*51
		long_name = User.new(@attr.merge(:name => long_name))
		long_name.should_not be_valid
	end

	it "Should accept valid email address" do
		addresses = %w[dwayne@bar.com  dwayne@is.jedi dwayne.learn@jp.com]
		addresses.each do |address|
		  valid_email_user =User.new(@attr.merge(:email => address))
		  valid_email_user.should be_valid
		end
	end

	it "Should not be valid" do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
		addresses.each do | address|
		  invalid_email_user = User.new(@attr.merge(:email => address))
		  invalid_email_user.should_not be_valid
	     end
	end


	it "Should reject duplicate email" do
		User.create!(@attr)
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

