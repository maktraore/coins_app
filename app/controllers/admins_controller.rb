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

    @receivers_locations_count = {"Manhattan"=> Receiver.where(location: "Manhattan").count, "Dobbs Ferry"=>Receiver.where(location: "Dobbs Ferry").count, "Tarrytown"=>Receiver.where(location: "Tarrytown").count, "Bronx"=> Receiver.where(location: "Bronx").count, "Yorktown"=>Receiver.where(location: "Yorktown").count}

    @receivers_races = {"Responsive" => Receiver.where(race:"Responsive").count, "Accurate" => Receiver.where(race:"Accurate").count, "Courteous" => Receiver.where(race:"Courteous").count, "Efficient" => Receiver.where(race:"Efficient").count}
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


  def destroy_ten
    @last_x_receivers = Receiver.all.first(10)
    @last_x_receivers.each{|r| r.destroy}
    redirect_to "/"
  end

  def destroy_twenty
    @last_x_receivers = Receiver.all.first(20)
    @last_x_receivers.each{|r| r.destroy}
    redirect_to "/"
  end
  
end
