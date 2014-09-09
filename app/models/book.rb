class Book < ActiveRecord::Base
  scope :with_isbns, -> {}
end
