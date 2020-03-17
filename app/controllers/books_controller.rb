class BooksController < ApplicationController
  def new
    @places = Place.all
    @book = Book.new
  end

  def index
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :auther, :place_id)
  end
end
