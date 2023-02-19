require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validation" do

    it "should pass when required fields are met and passwords match" do
      user = User.create(
        name: "Chloe",
        email: "buttercake@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to be_valid
    end

    it "should fail to create when password and password_confirmation do not match" do
      user = User.create(
        name: "Chloe",
        email: "buttercake@email.com",
        password: "password",
        password_confirmation: "notmypassword"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should fail to create when email is not unique (not case sensitive)" do
      user1 = User.create(
        name: "Chloe",
        email: "buttercake@email.com",
        password: "password",
        password_confirmation: "password"
      )
      user1.save!

      user2 = User.create(
        name: "Chloe",
        email: "BUTTERCAKE@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "should fail to create when name and email not given" do
      user = User.create(
        name: nil,
        email: nil,
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Name can't be blank")
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "should fail to create when password is less than 8 characters" do
      user = User.create(
        name: "Chloe",
        email: "buttercake@email.com",
        password: "pass",
        password_confirmation: "pass"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end


  describe '.authenticate_with_credentials' do
    
  end



end
