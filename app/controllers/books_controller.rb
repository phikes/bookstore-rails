class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books.to_json
  end

  def show
    @book = Book.find params[:id]
    render json: @book.to_json
  end

  def destroy
    Book.find(params[:id]).destroy
  end

  def create
    @book = Book.create book_params
  end

  private
  def book_params
    params.require(:book).permit :title, :author, :isbn, :rating
  end
end