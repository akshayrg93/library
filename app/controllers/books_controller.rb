class BooksController < ApplicationController
  
  layout "application"
  
  before_filter :find_book, only: [:show, :edit, :update, :destroy, :get_books]
  before_filter :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :require_user, only: [:show_book_list]
  
  def index
    @books = Book.order("name").page(params[:page]).per(5)
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
    respond_to do |format|
      format.html { redirect_to books_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def show_book_list
    @books = Book.where(user_id: nil )
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :language, :details, :no_of_copies)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end