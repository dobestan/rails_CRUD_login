class UsersController < ApplicationController
  def home
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

    redirect_to "/users/new"
  end

  def edit
  end

  def update
  end
end
