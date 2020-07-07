class EmailsController < ApplicationController
    $email = nil
    $to = nil
    $id = nil

    def fetch
        if session[:user].nil?
            render plain: "Unauthorized"
        end

        id = params[:message_id]
        id[0] = ''
        id[0] = ''
        id[0] = ''
        id[0] = ''
        id[-1] = ''
        id[-1] = ''
        id[-1] = ''
        id[-1] = ''
        $id = id
        @email = Email.where("message_id LIKE ?", "%"+id+"%")
        
        $email = @email
    end

    def show
        if session[:user].nil?
            render plain: "Unauthorized"
        end

        @email = {}
        $email.to_a.each do |e|
            @email[:from] = e.from
            @email[:subject] = e.subject
            @email[:body] = []
            line = ""
            e.body.split("").each do |c|
                if c == "\n"
                    @email[:body].push(line)
                    line = ""
                    next
                end
                line += c
            end
        end
    end

    def reply
        if session[:user].nil?
            render plain: "Unauthorized"
        end

        data = params[:data]
        to = $to
        subject = data[:subject]
        body = data[:body]
        
        @user = {}
        @user[:to] = to
        @user[:subject] = subject
        @user[:body] = body

        UserMailer.with(user: @user).email.deliver_now

        e = Email.where("message_id LIKE ?", "%"+$id+"%")
        temp = {}
        
        e.to_a.each do |a|
            temp[:id] = a.id
        end

        Email.update(temp[:id], :status => "replied")
    end

    def helper
        if session[:user].nil?
            render plain: "Unauthorized"
        end

        $to = params[:to]
        $to[0] = ''
        $to[0] = ''
        $to[0] = ''
        $to[0] = ''
        $to[-1] = ''
        $to[-1] = ''
        $to[-1] = ''
        $to[-1] = ''
    end

    def compose
        if session[:user].nil?
            render plain: "Unauthorized"
        end
        
        @to = $to
    end
end
