class UserSessionsController < ApplicationController
  def new
  	@user_session = UserSession.new
  end

  def create  
    @user_session = UserSession.new(params[:user_session])  
    if @user_session.save  
      flash[:win] = "Successfully logged in."  
      redirect_to root_url  
    else  
      flash[:fail] = "Invalid username or password"
      render :action => 'new'    
    end  
  end

  def edit  
    @user = current_user  
  end  
  
  def update  
    @user = current_user  
    if @user.update_attributes(params[:user])  
      flash[:notice] = "Successfully updated profile."  
      redirect_to root_url  
    else  
      render :action => 'edit'  
    end  
  end  

  def destroy  
    @user_session = UserSession.find  
    @user_session.destroy  
    flash[:notice] = "Successfully logged out."  
    redirect_to root_url  
  end  
end
