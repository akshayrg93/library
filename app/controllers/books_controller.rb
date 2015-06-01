class BooksController < ApplicationController
  #before_filter :find_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def show    
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end 
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def show_book_list
  	
  end
  private
  def book_params
    params.require(:book).permit(:name, :author, :language, :details)
  end


end