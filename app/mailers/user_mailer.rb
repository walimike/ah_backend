class UserMailer < ApplicationMailer
    def new_user_email
        @user = params[:user]
    
        mail(to: 'email@gmail.com', subject: "You got a new order!")
      end
end
