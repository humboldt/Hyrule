require 'rails_helper'

describe User  do

    before :each do
      @user = build(:user)
    end

    it "has a valid factory" do
      expect(@user).to be_valid
    end

    it "send greeting email after creating new user" do
      expect(@user).to receive(:send_greeting_email)
      @user.save
    end

    it "require an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "require an unique email" do
      @user= create(:user, email: 'test@test.com')
      @other_user = build(:user, email: 'test@test.com')
      expect(@other_user).to_not be_valid
    end

end
