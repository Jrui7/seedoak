class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = User.find(user)
    mail to: @user.email, subject: "Bienvenue dans la communauté Pickalgo"
  end

end
