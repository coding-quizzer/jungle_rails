require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should allow users to register when password and password_confirmation match' do
      user = User.new(first_name: "Robert", last_name: "Smith", email: "robby@gmail.com", password: "whereami", password_confirmation: "whereami")
      expect(user.save).to be true
    end

    it 'should not allow users to register when password and password_confirmation do not match' do
      user = User.create(first_name: "Robert", last_name: "Smith", email: "robby@gmail.com", password: "whereami", password_confirmation: "whoami")
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    
    it 'should not allow users to register with an already existing email' do
      User.create!(first_name: "Robert", last_name: "Smith", email: "robby@gmail.com", password: "whereami", password: "whereami")
      new_user = User.create(first_name: "Bob", last_name: "Richardson", email: "robby@gmail.com", password: "howisit", password_confirmation: "howisit")
      expect(new_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'should not allow users to register with an already existing email' do
      User.create!(first_name: "Robert", last_name: "Smith", email: "RoBBy@gmail.com", password: "whereami", password_confirmation: "whereami")
      new_user = User.create(first_name: "Bob", last_name: "Richardson", email: "robby@gmail.com", password: "howisit", password_confirmation: "howisit")
      expect(new_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'should not allow users to register without a valid first name' do
      user = User.create(last_name: "Smith", email: "robby@gmail.com", password: "whereami", password_confirmation: "whereami")
      expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should not allow users to register without a valid last name' do
      user = User.create(first_name: "Bob", email: "robby@gmail.com", password: "whereami", password_confirmation: "whereami")
      expect(user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'should not allow users to register without a valid email' do
      user = User.create(first_name: "Bob", last_name: "Smith", password: "whereami", password_confirmation: "whereami")
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should require the password to be at least 6 characters' do
      user = User.create(first_name: "Bob", last_name: "Smith", email: "robby@gmail.com", password: "asdf", password_confirmation: "asdf")
      expect(user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user_account = User.create!(first_name: "Henry", last_name: "Smith", email: "henry@Gmail.com", password: "whereami", password_confirmation: "whereami")
    end
      it 'should return user instance if user is successfully logged in' do
      user = User.authenticate_with_credentials('henry@Gmail.com', "whereami")
      expect(user).to eq @user_account
    end

    it 'should return nil if user is not successfully logged in' do
      user = User.authenticate_with_credentials('henry@Gmail.com', "whoami")
      expect(user).to be nil
    end

    it 'should ignore padding around email address' do
      user = User.authenticate_with_credentials(' henry@Gmail.com ', "whereami")
      expect(user).to eq @user_account
    end

    it 'should ignore padding around email address' do
      user = User.authenticate_with_credentials('HenRy@GMail.com', "whereami")
      expect(user).to eq @user_account
    end

  end

end
