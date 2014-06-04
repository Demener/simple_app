require 'spec_helper'

describe User do
	before  do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should be_valid }
	it { should respond_to(:authenticate) }
	it { should_not be_admin}

	#Added for sessions
	it { should respond_to(:remember_token)}

	describe "with admin set true" do
		before do
			@user.save!
			@user.toggle!(:admin)
		end
		it { should be_admin }
	end

	describe "no name" do
		before { @user.name = "" }
		it { should_not be_valid }
	end

	describe "no email" do
		before { @user.email = "" }
		it { should_not be_valid }
	end

	describe "name too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "invalid email format" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foobar@baz..com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "valid email format" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org first.last@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "duplicate email" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "no password" do
		before do
			@user = User.new(name: "Example User", email: "user@example.com", password: "", password_confirmation: "")
		end
		it { should_not be_valid }
	end

	describe "password mismatch" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "with valid password" do
			it {should eq found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

			it {should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
		end
	end

	describe "password too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid}
	end

	describe "remember toekn" do
		before { @user.save }
		its(:remember_token) { should_not be_blank }
	end
end
