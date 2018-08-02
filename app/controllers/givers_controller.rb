class GiversController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  # attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  def index
    @receivers = Receiver.all.order('updated_at DESC')
    @user= User.find_by(id: params[:id])

  end
  def edit
    @receiver = Receiver.find_by(id: params[:id])
    @user= User.find_by(id: params[:id])
  end

  def create
    @receiver = Receiver.create(giver_first_name: params[:giver_first_name], giver_last_name: params[:giver_last_name], first_name: params[:first_name], last_name: params[:last_name],email: params[:email], department: params[:department], location: params[:location], race: params[:race], coins:params[:coins])
           UserMailer.welcome_email(@receiver).deliver!
  end

  def destroy
    @receiver = Receiver.find_by(id: params[:id])
    @receiver.destroy
    redirect_to "/"
  end
end
