class InboxController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index

        mail = Mail.read_from_string(request.body.read)
        from = mail[:from]
        subject = mail[:subject]
        message_id = mail["Message-ID"]
        text_body = (mail.text_part || mail.html_part || mail).body.decoded
        content = {
            :from => from,
            :subject => subject,
            :message_id => message_id,
            :body => text_body,
            :status => "pending"
        }
        email = Email.new(content)
        email.save
    end

    def show
        @user = session[:user]
        if @user.nil?
            render plain: "Unauthorized"
        end

        if @user["admin"] == 1
            @email = Email.all.to_a
        else
            assignment = Assignment.where(username: @user["username"])
            message_ids = []
            assignment.to_a.each do |a|
                message_ids.push(a.message_id)
            end
            @email = []
            message_ids.each do |id|
                id[0] = ''
                id[0] = ''
                id[0] = ''
                id[0] = ''
                id[-1] = ''
                id[-1] = ''
                id[-1] = ''
                id[-1] = ''
                emails_temp = Email.where("message_id LIKE ?", "%"+id+"%").to_a
                emails_temp.each do |e|
                    @email.push(e)
                end
            end
        end
    end

    def assign
        if session[:user].nil?
            render plain: "Unauthorized"
        end
        
        content = {
            :username => params["username"],
            :message_id => params["message_id"]
        }

        if !Assignment.find_by(message_id: params["message_id"]).nil?
            redirect_to :action => "Already assigned", :status => 500
        else
            assignment = Assignment.new(content)
            if assignment.save
                render plain: "Successful"
            end
        end
    end
end
