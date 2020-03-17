class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new(book_params)
  end

  def show

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :auther, :isbn, :image_url, :publish_date, :publisher, :page_count, :textshippet, :place_id)
  end
end
