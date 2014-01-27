class UserMailer < ActionMailer::Base
  default from: "from@collaborate.com"

  def welcome_email(user)
    @user = user
    @url = 'http://collaborate.com/login'  # route to site's login page
    mail(to: @user.email, subject: 'Welcome')
  end
end
