class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
   default from: "from@example.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

def registration_confirmation(user)
  @user=user

  mail(:to => "#{user.email}" , :subject => "please confirm your registration")
end

end
