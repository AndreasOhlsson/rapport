class UserMailer < ApplicationMailer

  # new comment has been added to a ticket by anon
  def notify_new_comment(user, token)
    @ticket = Ticket.find_by(token: token)
    @user = user
    mail(to: @user.email, subject: "Ny kommentar av anonym på #{@ticket.title}" )
  end

  # new ticket has been created
  def notify_user_new_ticket(emails, token)
    @ticket = Ticket.find_by(token: token)
    @role = @ticket.role
    if @ticket.role == 'both'
      @role = 'quratelet och seniors'
    end
    mail(bcc: emails, subject: "Nytt ärende #{@ticket.title}" )
  end

end
