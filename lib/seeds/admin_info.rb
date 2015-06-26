module AdminInfo
	def add_admin_info
		User.create!( name: "admin", address: "vatakara", email: "admin@admin.com", phone: "8891384095", state: "kerala", country: "India", password: "admin", password_confirmation: "admin", activated: true, role: true)
	end	
end