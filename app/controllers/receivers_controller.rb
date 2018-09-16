class ReceiversController < ApplicationController

  def index
      @receivers =  Receiver.all.order(created_at: :desc) 
      @receivers_manhattan = Receiver.where(location: "Manhattan").order(created_at: :desc) 
      @receivers_bronx = Receiver.where(location: "Bronx").order(created_at: :desc) 
      @receivers_dobbs_ferry = Receiver.where(location: "Dobbs Ferry").order(created_at: :desc) 
      @receivers_york_town = Receiver.where(location: "York Town").order(created_at: :desc) 
      filename = Time.now.in_time_zone('Eastern Time (US & Canada)').strftime("%b %e %Y, %l:%M %p")
      respond_to do |format|
        format.html
        format.xlsx{
          response.headers['Content-Disposition'] = 'attachment; filename="recipients_as_of_' + filename + '.xlsx"'
          }
      end
  end

  def new
  end

  def create
    @receiver = Receiver.create(giver_first_name: params[:giver_first_name], giver_last_name: params[:giver_last_name], first_name: params[:first_name], last_name: params[:last_name],email: params[:email], department: params[:department], location: params[:location], race: params[:race], coins:params[:coins])
    flash[:success] = "The receiver information has been saved"
           UserMailer.welcome_email(@receiver).deliver!
  end

  def destroy
    @receiver = Receiver.find_by(id: params[:id])
    @receiver.destroy
    redirect_to "/"
  end

   def edit
    @receiver = Receiver.find_by(id: params[:id])
  end

  def update
    @receiver = Receiver.find_by(id: params[:id])
    @receiver.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],race: params[:race], coins: params[:coins], giver_first_name: params[:giver_first_name], giver_last_name: params[:giver_last_name], location: params[:location], department: params[:department])
    flash[:success] = "The #{@receiver.first_name}\'s account has been updated"
    redirect_to "/"
  end

end
