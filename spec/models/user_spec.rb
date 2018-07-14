require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}

  describe 'session token' do
    it "assigns a session token if one is not give" do
      expect(FactoryBot.build(:user).session_token).not_to be_nil
    end
  end

  it { should validate_length_of(:password).is_at_least(6)}
  describe 'pass encryption' do
    it "reset password to nil after log in" do
      User.create(username: "ti", password: 'qwerty')
      user2 = User.find_by(username: "ti")
      expect(user2.password).to be_nil
    end

    it 'encrypts the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with("123456")
      FactoryBot.build(:user)
    end
  end
end
