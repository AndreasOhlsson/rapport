class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :new, :create, :search, :token]
 

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    @unread = @tickets.unread_by(current_user).order("created_at desc")
    @read = @tickets.read_by(current_user).order("created_at desc")
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @comments = @ticket.comments
    @comment = @ticket.comments.new
    @ticket.mark_as_read! for: current_user if current_user.present?
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save

        if @ticket.role == 'both'
          User.all.each do |u|
            UserMailer.notify_user_new_ticket(u, @ticket.token).deliver
          end
        end
        User.where(role: @ticket.role).each do |u|
          UserMailer.notify_user_new_ticket(u, @ticket.token).deliver
        end

        format.html { redirect_to :action => 'token', :token => @ticket.token }
        format.json { render :token, status: :created, location: @ticket }
      else 
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def token
    @ticket = Ticket.find_by(token: params[:token])
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find_by(token: params[:token]).destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  def mark_as_read
    @ticket = Ticket.find_by(token: params[:token])
    @ticket.mark_as_read! :for => current_user
    
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def search
    if params[:token].present? && Ticket.where(token: params[:token]).present?
      redirect_to ticket_path(params[:token])
    else
      flash.now[:danger] = 'En ticket med ett sådant id existerar ej'
      render 'visitors/index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find_by(token: params[:token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:title, :dateOfEvent, :message, :token, :role, user_ids: [])
    end
end
