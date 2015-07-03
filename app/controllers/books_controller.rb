class BooksController < ApplicationController
  
  layout "application"
  
  before_filter :find_book, only: [:show, :edit, :update, :destroy, :get_books, :buy_selected_books]
  before_filter :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :require_user, only: [:show_book_list]
  
  autocomplete :book, :name, :full => true
  
  def index
    if params[:search]
      @books = Book.where('name LIKE ?', "%#{params[:search]}%").order("name").page(params[:page]).per(5)
    else
      @books = Book.order_by_name.page(params[:page]).per(5)
    end
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
    if params[:type] == "lend"
      @books = Book.available_for_lending
    elsif params[:type] == "buy"
      @books = Book.available_for_selling
    else
      @books = Book.available_for_lending
    end
  end

  def buy_selected_books
    @copies = params[:no_of_copies]
    @cost = @book.price * params[:no_of_copies].to_f
  end

  def payment
    @book = Book.find(params[:id1])
    @book.update_attributes(:no_of_copies => @book.no_of_copies - params[:id2].to_i)
    redirect_to user_path(current_user), :flash => { :bought_the_book => "You bought the book" }
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :language, :details, :no_of_copies, :price, :purchasable)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end