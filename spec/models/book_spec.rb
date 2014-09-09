require 'rails_helper'

RSpec.describe Book, :type => :model do
  let!(:book) { FactoryGirl.create(:book, title: "A Test Book", subtitle: "A very good book", isbn: "978111111111") }

  context '.user' do
    it { should belong_to(:user) } 
  end

  context '.title' do
    it 'cannot be nil' do
      book.title = nil
      book.save
      expect(book).to_not be_valid
    end
  end

  context '.subtitle' do
    it 'cannot be nil' do
      book.subtitle = nil
      book.save
      expect(book).to_not be_valid
    end

  end

  context '.title_subtitle' do
    it 'returns a combo of the title and subtitle' do
      expect(book.title_subtitle).to eql("A Test Book: A very good book")
    end
  end

  context 'self.with_isbns' do
    it 'returns all books with an ISBM' do
      expect(Book.with_isbns).to include(book)
    end
  end
end
