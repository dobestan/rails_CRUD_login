class UsersController < ApplicationController
  def dummy_string
    return "In most procedural languages, an API specifies a set of functions or routines that accomplish a specific task or are allowed to interact with a specific software component. This specification is presented in a human readable format in paper books, or in electronic formats like ebooks or as man pages. For example, the math API on Unix systems is a specification on how to use the mathematical functions included in the math library. Among these functions there is a function, named sqrt(), that can be used to compute the square root of a given number."
  end

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
    @user.password = Digest::MD5.hexdigest(dummy_string + @user.username + params[:password])
    @user.save

    redirect_to "/users/home"
  end
 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.password = Digest::MD5.hexdigest(dummy_string + @user.username + params[:password] )
    @user.save

    redirect_to "/users/home"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to "/users/home"
  end

  #login -> login_checker
  def login
  end

  def login_checker
    # if username exist
    if @user=User.find_by(username: params[:username])
      if @user.password == Digest::MD5.hexdigest(dummy_string + @user.username + params[:password])
        render :text => "Login Successful!"
      else
        render :text => "Wrong Password"
      end
    else
      render :text => "Username Not Exist On Server."
    end
  end
end
