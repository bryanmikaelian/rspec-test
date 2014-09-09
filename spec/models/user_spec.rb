require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) { FactoryGirl.build(:user, first_name: 'Test', last_name: 'User', email: 'test@test.local', bio: 'This is me!') }

  context '.address' do
    it { should have_one(:address) }
  end

  context '.books' do
    it { should have_many(:books) }
  end

  context '.first_name' do
    it 'cannot be nil' do
      user.first_name = nil
      user.save
      expect(user.reload).to_not be_valid
    end
  end

  context '.last_name' do
    it 'cannot be nil' do
      user.last_name = nil
      user.save
      expect(user.reload).to_not be_valid
    end
  end

  context '.email' do
    it 'cannot be nil' do
      user.email = nil
      user.save
      expect(user.reload).to_not be_valid
    end
  end

  context '.bio' do
    it 'cannot be nil' do
      user.bio = nil
      user.save
      expect(user.reload).to_not be_valid
    end
  end

  context '.full_name' do
    it 'returns the full name' do
      expect(user.full_name).to eql("Test User")
    end
  end
end
