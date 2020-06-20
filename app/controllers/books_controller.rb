# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show]
  before_action :logged_in_user

  def new
    @places = Place.all
    @book = Book.new
  end

  def index
    @books = Book.order(:title).page params[:page]
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @user = current_user
    @book = Book.find(params[:id])
    if @book.update_attributes(last_rental: @user.name)
      flash[:success] = 'Rental updated'
      redirect_to @book
    else
      render 'show'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = 'Book deleted'
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :image_url, :publish_date,
                                 :publisher, :page_count, :textship, :description, :place_id)
  end

  def textship_params
    params.permit(:textship)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def logged_in_user
    if logged_in?
    else
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
