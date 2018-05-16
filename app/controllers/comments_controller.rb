class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @ticket = @comment.ticket

    if @comment.save
      flash[:success] = 'Ny kommentar skapad'
      if (!user_signed_in?)
        @ticket.update(updated_at: Time.now)
        comments = @ticket.comments.where.not(user_id: nil)
        user_ids = comments.map{ |e| e.try(:user_id) }.uniq
        user_ids.each do |id|
          user = User.find(id)
          if !user.deactivated
            token = @ticket.token
            # send email
            UserMailer.notify_new_comment(user, token).deliver
          end
        end
      end
      redirect_to ticket_url(@ticket.token)
    else
      flash[:danger] = "En kommentar får inte vara tom"
      redirect_to ticket_url(@ticket.token)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :token, :user_id)
  end
end