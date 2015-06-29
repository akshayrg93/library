class RegistrationMail < ApplicationMailer	
	def sample_email(user)
      @user = user
      mail(to: @user.email, subject: 'Registration Complete')
    end
end