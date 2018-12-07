class UserMailer < ApplicationMailer
  # default from: 'gmtesting17@gmail.com'#'notifications@learningcenters.com'
  default from: 'coinsapp@mercy.edu'#'notifications@learningcenters.com'
  def welcome_email(user)
    @receiver = user 
    @url = 'https://www.mercy.edu/service-excellence'
    mail(to: @receiver.email, subject: 'Cogratulation!')
  end
end
