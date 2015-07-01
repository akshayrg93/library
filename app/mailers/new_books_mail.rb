class NewBooksMail < ApplicationMailer	
	def new_books_mail(user)
    @user = user
    mail(to: @user.email, subject: 'New Books For Sale')
  end
end