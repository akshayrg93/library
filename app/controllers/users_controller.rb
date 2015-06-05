class UsersController < ApplicationController
  layout "application"
  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:sort] == "asc"
      @users = User.order("name ASC") 
    elsif params[:sort] == "desc"
      @users = User.order("name DESC")
    elsif params[:sort] == "country_asc"
      @users = User.order("country ASC")
    elsif params[:sort] == "country_desc"
      @users = User.order("country DESC")
    else
      @users = User.order("created_at DESC")
    end  
  end

  def show  
      
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end 
  end

  def edit

  end

  def update
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
    selected_user = session[:selected_user]
    @book = Book.find(params[:id])
    @user = User.find(selected_user)

    if @user.book_count >= 3
      redirect_to user_path(@user), :flash => { :failure => "You cannot take more than 3 books" }
    else
      @book.update_attributes(:user_id => session[:selected_user])
      @user.update_attributes(:book_name => @book.name, :book_count => @user.book_count + 1)
      redirect_to user_path(@user), :flash => { :success => "You got the book" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :email, :phone, :state, :country)
  end

  def find_user
    @user = User.find(params[:id])
  end

end