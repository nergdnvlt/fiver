require 'rails_helper'

describe User do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
  end

  describe 'Uniqueness' do
    it 'test for username' do
      create(:user, username: 'fluffy')
      user2 = User.new(name: 'fluffy', username: 'fluffy', email: 'fluffy@fluffy.com')

      expect(user2).to be_invalid
    end

    it 'test for email' do
      create(:user, email: 'fluffy@fluffy.com')
      user2 = User.new(name: 'fluffy', username: 'fluffy', email: 'fluffy@fluffy.com')

      expect(user2).to be_invalid
    end
  end

  describe 'sets slug properly' do
    it 'sets the slug from username' do
      user = create(:native_user)

      expect(user.slug).to eq(user.username.parameterize)
    end
  end
end
