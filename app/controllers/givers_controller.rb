class GiversController < ApplicationController
  def index
  end

  def new
  
  end
def create
  @receiver = Receiver.create(giver_first_name: params[:giver_first_name], giver_last_name: params[:giver_last_name], first_name: params[:first_name], last_name: params[:last_name],email: params[:email], department: params[:department], location: params[:location], race: params[:race])
end
end
