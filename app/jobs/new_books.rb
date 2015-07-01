class NewBooks
  @queue = :send_new_books_mail
  def self.perform
  	@users = User.activated_users
  	@users.each do |user|
  	  NewBooksMail.new_books_mail(user).deliver!
    end
  end
end