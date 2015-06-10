class HomeController < ApplicationController
	before_filter :require_admin, only: [:admin_home]
	layout "welcome"

	def admin_home
		
	end
end
