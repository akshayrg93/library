class NewBooks
  @queue = :new_books
  def self.perform(user_id)
  	@user = User.find(user_id)
    RegistrationMail.sample_email(@user).deliver!
  end
end