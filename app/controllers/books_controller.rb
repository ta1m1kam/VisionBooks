class BooksController < ApplicationController
  def new
    @places = Place.all
    @book = Book.new
  end

  def index
    @book = Book.new(book_params)
  end

  def show; end

  def create
    binding.pry
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :image_url, :publish_date, :publisher, :page_count, :textship, :description, :place_id)
  end
end
