class Book < ActiveRecord::Base
  validates :title, presence: true, allow_blank: false
  validates :author, presence: true
  validates :isbn, presence: true, isbn_format: true
  validates :rating, numericality: { less_than_or_equal_to: 5,
                                     greater_than_or_equal_to: 0 }
end
