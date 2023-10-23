require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    it 'should validate if all fields are provided' do
      user = User.create(
        first_name: 'Bob',
        last_name: 'Morane',
        email: 'bob@morane.ca',
        password: '1111',
        password_confirmation: '1111'
      )
      # puts "Checking user"
      # p user
      # print 'user valid?: '
      # p user.valid?
      expect(user).to be_valid
    end
    it 'should error if missing field' do
      user = User.create(
        first_name: 'Bob',
        # last_name: nil,
        email: 'bob@morane.ca',
        password: '1111',
        password_confirmation: '1111'
      )
      # puts 'Checking user'
      # p user
      # print 'user valid?: '
      # p user.valid?
      # p user.errors.full_messages
      expect(user).to be_invalid
      expect(user.errors.full_messages[0]).to include "can't be blank"
    end

    it 'password and password_confirmation should be identical' do
      user = User.new(
        first_name: 'Bob',
        last_name: 'Morane',
        email: 'bob@morane.ca',
        password: '1111',
        password_confirmation: '2222'
      )
      # puts 'Checking password identical'
      # p user
      # print 'user valid?: '
      # p user.valid?
      # p user.errors.full_messages
      expect(user).to be_invalid
      expect(user.errors.full_messages[0]).to include "confirmation doesn't match"
    end
    it 'password should be at least 4 characters' do
      user = User.new(
        first_name: 'Bob',
        last_name: 'Morane',
        email: 'bob@morane.ca',
        password: '111',
        password_confirmation: '111'
      )
      puts 'Checking password length'
      p user
      print 'user valid?: '
      p user.valid?
      p user.errors.full_messages
      expect(user).to be_invalid
      expect(user.errors.full_messages[0]).to include 'Password is too short'
    end
    it 'password fields should be provided' do
      user = User.create(
        first_name: 'Bob',
        last_name: 'Morane',
        email: 'bob@morane.ca',
        password: '1111',
        password_confirmation: nil
      )
      # puts 'Checking password provided'
      # p user
      # print 'user valid?: '
      # p user.valid?
      # p user.errors.full_messages
      expect(user).to be_invalid
      expect(user.errors.full_messages[0]).to include "can't be blank"
    end
    it 'emails should be unique' do
      user1 = User.create(
        first_name: 'Bob',
        last_name: 'Morane',
        email: 'bob@morane.ca',
        password: '1111',
        password_confirmation: '1111'
      )
      # puts 'Checking password uniqueness'
      # p user
      # print 'user valid?: '
      # p user1.valid?
      # p user1.errors.full_messages
      user2 = User.create(
        first_name: 'Bob',
        last_name: 'Morane',
        email: 'BOB@morane.ca',
        password: '1111',
        password_confirmation: '1111'
      )
      # puts 'Checking password uniqueness'
      # p user2
      # print 'user valid?: '
      # p user2.valid?
      # p user2.errors.full_messages
      expect(user2).to be_invalid
      expect(user2.errors.full_messages[0]).to include 'Email has already been taken'
    end
  end
end
