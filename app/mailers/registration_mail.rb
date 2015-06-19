class RegistrationMail < ApplicationMailer	
	def sample_email(user)
      @user = user
      puts ".............................."
      puts @user
      puts @user.email
      puts ".............................."
      mail(to: @user.email, subject: 'Sample Email')
    end
end