class UsersController < ApplicationController

  layout "application"
  
  before_filter :find_user, only: [:show, :destroy, :activate_user, :deactivate_user]
  before_filter :require_user, only: [:show, :edit, :update, :get_book]
  before_filter :require_no_user, only: [:new, :create]
  before_filter :require_admin, only: [:index]
  
  def index
    if params[:sort] == "asc"
      @users = User.order_by_name_asc 
    elsif params[:sort] == "desc"
      @users = User.order_by_name_desc
    elsif params[:sort] == "country_asc"
      @users = User.order_by_country_asc
    elsif params[:sort] == "country_desc"
      @users = User.order_by_country_desc
    else
      @users = User.order_by_created
    end  
  end

  def show     
    Resque.enqueue(NewBooks, @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)  
    if @user.save
      Resque.enqueue(RegistrationMailer, @user.id)
      redirect_to logout_path, :flash => { :activation_required => "Successfully registered... Please wait for activation.." }
    else
      render :action => "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def get_book
    if params[:book_ids].nil?
      redirect_to show_available_books_path(current_user), :flash => { :failure => "You have not selected any book" }
    elsif current_user.book_count + params[:book_ids].size > 3
      redirect_to show_available_books_path(current_user), :flash => { :failure => "You cannot take more than 3 books" }
    else
      params[:book_ids].each do |book|
        @book = Book.find(book)
        @book.update_attributes(:user_id => current_user.id)
        current_user.update_attributes(:book_name => @book.name, :book_count => current_user.book_count + 1)
      end
      redirect_to user_path(current_user), :flash => { :success => "You got the book(s)" }
    end
  end

  def buy_book
    @book = Book.find(params[:id])
  end

  def return_book
    @user = current_user
    @book = Book.find(params[:id])
    @user.update_attributes(:book_name => nil, :book_count => current_user.book_count - 1)
    @book.update_attributes(:user_id => nil)
    redirect_to user_path(current_user)
  end

  def activate_user
    @user.update_attributes(:activated => true)
    redirect_to users_path
  end

  def deactivate_user
    @user.update_attributes(:activated => false)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :email, :phone, :state, :country, :password, :password_confirmation, :activated)
  end

  def find_user
    @user = User.find(params[:id])
  end
end