require 'resque/tasks'
require 'resque/scheduler'

namespace :book do
  desc "Send mail to users on addition of new books"
  task :send_new_books_mail => :environment do
    Resque.enqueue(NewBooks)
  end
end