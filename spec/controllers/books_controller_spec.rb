require 'spec_helper'

describe BooksController do
  describe 'GET #index' do
    it 'populates an array of books' do
      get :index
      expect(assigns :books).to eq Book.all
    end
  end
end