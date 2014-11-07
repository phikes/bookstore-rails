class BooksController < ApplicationController
  before_filter :set_headers

  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find params[:id]
    render json: @book
  end

  def destroy
    Book.find(params[:id]).destroy
  end

  def create
    book = Book.new book_params
    if book.save
      render json: book
    else
      render json: { errors: book.errors.messages }
    end
  end

  def update
    @book = Book.find params[:id]
    @book.update book_params
  end

  private
  def book_params
    params.require(:book).permit :title, :author, :isbn, :rating
  end

  def set_headers
    if request.headers["HTTP_ORIGIN"]
    # better way check origin
    # if request.headers["HTTP_ORIGIN"] && /^https?:\/\/(.*)\.some\.site\.com$/i.match(request.headers["HTTP_ORIGIN"])
      headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
      headers['Access-Control-Max-Age'] = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end
end