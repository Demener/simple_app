class UserMailer < ActionMailer::Base
  default from: "gameglamors@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://localhost:3000/signin'
  	mail(to: @user.email, subject: 'Welcome to Game Glamors!')
  end

  def password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "Password Reset"
  end
end
