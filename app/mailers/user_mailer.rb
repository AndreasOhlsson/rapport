class UserMailer < ApplicationMailer

  # new comment has been added to a ticket by anon
  def notify_new_comment(user, token)
    @ticket = Ticket.find_by(token)
    @user = user
    mail(to: @user.email, subject: "Ny kommentar av anonym på #{@ticket.title}" )
  end

end
