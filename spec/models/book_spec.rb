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
  it 'is invalid with a nil author' do
    expect(FactoryGirl.build :book, author: nil).to_not be_valid
  end
  it 'is invalid with a wrong isbn' do
    expect(FactoryGirl.build :book, isbn: '9780000000001').to_not be_valid
  end
  it 'is invalid with a nil isbn' do
    expect(FactoryGirl.build :book, isbn: nil).to_not be_valid
  end
  it 'is invalid with a rating greater than 5' do
    expect(FactoryGirl.build :book, rating: 6).to_not be_valid
  end
  it 'is invalid with a rating less than 0' do
    expect(FactoryGirl.build :book, rating: -1).to_not be_valid
  end
end
