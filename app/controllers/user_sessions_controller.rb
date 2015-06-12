class UserSessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy, :edit, :update]
  
  def new
  	@user_session = UserSession.new
  end

  def create  
    @user_session = UserSession.new(params[:user_session])  
    if @user_session.save
      current_user = UserSession.find.user
      flash[:win] = "Successfully logged in."
      if @user_session.user.role
        redirect_to admin_home_path 
      else
        redirect_to user_path(current_user)
      end        
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
      flash[:profile_update] = "Successfully updated profile."  
      redirect_back_or_default user_path(current_user)  
    else  
      render :action => 'edit'  
    end  
  end  

  def destroy
    current_user_session.destroy  
    flash[:notice] = "Successfully logged out."  
    redirect_to root_url  
  end  
end