require 'spec_helper'

describe Book do
  # factory
  it 'has a valid factory' do
    expect(FactoryGirl.create :book).to be_valid
  end

  # validations
  it 'is invalid without a title' do
    expect(FactoryGirl.build :book, title: '').to_not be_valid
  end
  it 'is invalid with an empty author' do
    expect(FactoryGirl.build :book, author: nil).to_not be_valid
  end
  it 'is invalid with a wrong isbn' do
    expect(FactoryGirl.build :book, isbn: '9780000000001').to_not be_valid
  end
  it 'is invalid with an empty isbn' do
    expect(FactoryGirl.build :book, isbn: nil).to_not be_valid
  end
  it 'is invalid with a rating greater than 5' do
    expect(FactoryGirl.build :book, rating: 6).to_not be_valid
  end
  it 'is invalid with a rating less than 0' do
    expect(FactoryGirl.build :book, rating: -1).to_not be_valid
  end

  it 'is valid with a rating in between 0 and 5' do
    1.upto 5 do |i|
      expect(FactoryGirl.build :book, rating: i).to be_valid
    end
  end
end
