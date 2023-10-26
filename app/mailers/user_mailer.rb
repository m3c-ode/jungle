class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email (user)
    @user = user
    @url = 'http://jungle.com/login'
    mail(to: @user.email, subject: "Welcome to Jungle")
  end

  
end
