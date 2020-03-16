class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
  end
end
