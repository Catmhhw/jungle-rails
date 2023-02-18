require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do

    it "should" do
      user = User.create(
        name: "Chloe",
        email: "buttercake@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to be_valid
    end

end
