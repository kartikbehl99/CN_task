class UserMailer < ApplicationMailer
    default from: "kartikbehl99@gmail.com"

    def email
        @user = params[:user]
        @to = @user[:to]
        @subject = @user[:subject]
        @body = @user[:body]

        mail(to: @to, subject: @subject)
    end
end
