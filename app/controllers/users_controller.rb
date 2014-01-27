class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  # before_filter :authorize, except: [:index, :show] # dont have to log on for index and show pages

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.errors.empty?
      UserMailer.welcome_email(@user).deliver
      sign_in(@user)
      redirect_to user_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages # displays why the form cant be submitted to the user
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
