require 'spec_helper'

describe BooksController do
  # negative cases are mostly defined application controller spec
  # TODO negative cases (validations mainly)

  describe 'GET #index' do
    it 'populates an array of books' do
      get :index
      expect(assigns :books).to eq(Book.all)
    end
  end

  describe 'GET #show' do
    let(:book) { FactoryGirl.create :book }
    it 'populates the requested book' do
      get :show, id: book
      expect(assigns(:book)).to eq(book)
    end
  end

  describe 'DELETE #destroy' do
    let(:book) { FactoryGirl.create :book }
    it 'deletes the requested book' do
      delete :destroy, id: book
      expect(book).to be_destroyed
    end
  end

  describe 'POST #create' do
    let(:book) { FactoryGirl.build :book }
    it 'creates a new record if valid' do
      expect { post :create, book: book.attributes }.to change(Book, :count).by 1
    end
  end

  describe 'PUT #update' do
    let(:book) { FactoryGirl.create :book }
    it 'changes the title of a valid record' do
      put :update, 
          id: book, 
          book: FactoryGirl.attributes_for(:book, author: 'Hans')
      book.reload
      expect(book.author).to eq 'Hans'
    end
  end
end