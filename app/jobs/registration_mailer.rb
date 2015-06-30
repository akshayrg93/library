class RegistrationMailer
	@queue = :registration_mailer_queue

  def self.perform(user_id)
    @user = User.find(user_id)
    RegistrationMail.sample_email(@user).deliver!
  end
end 