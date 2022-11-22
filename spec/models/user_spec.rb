require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should allow users to register when password and password_confirmation match' do
      @user = User.new(name: "Robert", email: "robby@gmail.com", password: "whereami", password_confirmation: "whereami")
      expect(@user.save).to be true
    end

    it 'should not allow users to regester when password and password_confirmation do not match' do
      @user = User.create(name: "Robert", email: "robby@gmail.com", password: "whereami", password_confirmation: "whoami")
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    
    it 'should not allow users to register with an already existing password' do
      User.create!(name: "Robert", email: "robby@gmail.com", password: "whereami", password: "whereami")
      @new_user = User.new(name: "Bob", email: "robby@gmail.com", password: "howisit", password_confirmation: "howisit")
      expect(@new_user.save).to be false
    end
  end
end
