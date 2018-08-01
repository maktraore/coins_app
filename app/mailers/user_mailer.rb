class UserMailer < ApplicationMailer
  default from: 'gmtesting17@gmail.com'#'notifications@learningcenters.com'
  def welcome_email(user)
    @receiver = user 
    @url = 'http://www.google.com'
    mail(to: @receiver.email, subject: 'Cogratulation!')
  end
end
