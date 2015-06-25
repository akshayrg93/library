# Preview all emails at http://localhost:3000/rails/mailers/registration_mail
class RegistrationMailPreview < ActionMailer::Preview
  def sample_mail_preview
    RegistrationMail.sample_email(User.last)
  end
end

