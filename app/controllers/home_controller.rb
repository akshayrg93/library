class HomeController < ApplicationController
  
  layout "home"
  
  before_filter :require_admin, only: [:admin_home]   
  before_filter :page_decider, except: [:admin_home]
  
  private
  
  def page_decider
  	if current_user.present?
 			if admin_user?
 				redirect_to admin_home_path
 			else
 				redirect_to user_path(current_user)
 			end
  	else 
    	render 'index'
  	end
	end
	
	def admin_user?
  	current_user.present? && current_user.role?
	end

  def index	
  end
  
  def admin_home 	
  end
end