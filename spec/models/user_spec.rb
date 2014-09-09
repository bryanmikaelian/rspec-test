require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) { FactoryGirl.build(:user, first_name: 'Test', last_name: 'User', email: 'test@test.local', bio: 'This is me!') }
  let!(:book) { FactoryGirl.create(:book, title: "A Test Book", subtitle: "A very good book", isbn: "978111111111", user: user) }

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
      expect(user).to_not be_valid
    end
  end

  context '.last_name' do
    it 'cannot be nil' do
      user.last_name = nil
      user.save
      expect(user).to_not be_valid
    end
  end

  context '.email' do
    it 'cannot be nil' do
      user.email = nil
      user.save
      expect(user).to_not be_valid
    end
  end

  context '.bio' do
    it 'cannot be nil' do
      user.bio = nil
      user.save
      expect(user).to_not be_valid
    end
  end

  context '.full_name' do
    it 'returns the full name' do
      expect(user.full_name).to eql("Test User")
    end
  end

  context '.reading_isbn?' do
    it 'returns true if the person has a book with a given ISBN' do
      expect(user.reading_isbn?(book.isbn)).to be_true
    end

    it 'returns false if the person does not have a book with a given ISBN' do
      expect(user.reading_isbn?("9782222222222")).to be_false
    end
  end
end
