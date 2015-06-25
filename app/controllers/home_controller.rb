class HomeController < ApplicationController
  
  layout "home"
  
  before_filter :require_admin, only: [:admin_home]   
  
  def admin_home		
  end
end
