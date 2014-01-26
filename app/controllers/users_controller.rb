class UsersController < ApplicationController
  def home
    @users = User.all
  end

  #new -> create
  def new
  end

  def create
    #Digest::MD5.hexdigest(password)

    @user = User.new
    @user.username = params[:username]
    @user.password = Digest::MD5.hexdigest(params[:password])
    @user.save

    redirect_to "/users/home"
  end
 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.password = Digest::MD5.hexdigest(params[:password])
    @user.save

    redirect_to "/users/home"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to "/users/home"
  end
end
