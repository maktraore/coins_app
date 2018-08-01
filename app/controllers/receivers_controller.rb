class ReceiversController < ApplicationController

   def edit_receiver
    @receiver = Receiver.find_by(id: params[:id])
  end
  def update_receiver
    @receiver = Receiver.find_by(id: params[:id])
    @receiver.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],race: params[:race], coins: params[:coins], giver_first_name: params[:giver_first_name], giver_last_name: params[:giver_last_name], location: params[:location], department: params[:department])
    redirect_to "/"
  end
  def update_admin
    @user = User.find_by(id: params[:id])
    p @user.errors.full_messages
    Rails.logger.info(@user.errors.inspect)
    @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], super_admin: params[:super_admin], admin: params[:admin])
    @user.admin = params[:admin]
    @user.super_admin =params[:super_admin]
    @user.save
    redirect_to "/"
  end

  def delete_admin
    @user= User.find_by(id: params[:id])
    @user.destroy
    redirect_to "/"
  end
end
