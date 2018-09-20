class AdminsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit]

  def new
  end

  def edit
    @user= User.find_by(id: params[:id])
  end

  def index
    @receivers = Receiver.all.order('created_at ASC')
    @user= User.find_by(id: params[:id])
    @receivers =  Receiver.all.order(created_at: :desc) 

    @receivers_locations_count = {"Bronx"=> Receiver.where(location: "Bronx").count, "Dobbs Ferry"=>Receiver.where(location: "Dobbs Ferry").count, "Tarrytown"=>Receiver.where(location: "Tarry Town").count, "Yorktown"=>Receiver.where(location: "York Town").count}
  end

  def create
    user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], admin: params[:admin], super_admin:params[:super_admin])
    flash[:success] = "The #{user.first_name}\'s account has been created"
    redirect_to "/"
           
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], super_admin: params[:super_admin], admin: params[:admin])
    @user.admin = params[:admin]
    @user.super_admin =params[:super_admin]
    @user.save
    flash[:success] = "The #{@user.first_name}\'s account has been updated"
    redirect_to "/"
  end

  def destroy
    @user= User.find_by(id: params[:id])
    @user.destroy
    render "index"
  end
  
end
