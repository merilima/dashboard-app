require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures username presence' do
      user = User.new(password_confirmation:'123456', password: '123456', email: 'sample@example.com').save
      expect(user).to eq(false)
    end
    it 'ensures email presence' do
      user = User.new(password_confirmation:'123456', password: '123456', username: 'username').save
      expect(user).to eq(false)
    end
    it 'ensures username, email presence' do
      user = User.new(password_confirmation:'123456', password: '123456', email: 'sample@example.com', username:'username').save
      expect(user).to eq(true)
    end
    it 'checks if password is valid' do
      user = User.new(password_confirmation:'1236', password: '1236', email: 'sample@example.com', username:'username').save
      expect(user).to eq(false)
    end
    it 'checks password matching' do
      user = User.new(password_confirmation:'1236', password: '123456', email: 'sample@example.com', username:'username').save
      expect(user).to eq(false)
    end
    it 'checks if username is unique' do
      user = User.new(password_confirmation:'123456', password: '123456', email: 'sample1@example.com', username:'username').save
      expect(user).to eq(true)
      user1 = User.new(password_confirmation:'123456', password: '123456', email: 'sample@example.com', username:'username').save
      expect(user1).to eq(false)
    end
    it 'checks if username can be same as email' do
      user = User.new(password_confirmation:'123456', password: '123456', email: 'sample1@example.com', username:'username').save
      expect(user).to eq(true)
      user1 = User.new(password_confirmation:'123456', password: '123456', email: 'sample@example.com', username:'sample1@example.com').save
      expect(user1).to eq(false)
    end
    it 'checks if email is unique' do
      user = User.new(password_confirmation:'123456', password: '123456', email: 'sample@example.com', username:'username1').save
      expect(user).to eq(true)
      user1 = User.new(password_confirmation:'123456', password: '123456', email: 'sample@example.com', username:'username').save
      expect(user1).to eq(false)
    end
  end   
end
