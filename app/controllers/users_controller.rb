class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :input_password, :confirmation_password))
    if @user.save
     
      redirect_to :users
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def account
    @email = current_user.email
  end

  def profile
    @name = current_user.name
  end
  
  def profile_edit
    @user = current_user
  end
  
  def edit
  end

  def update
    @user = User.find(params[:id])
     if @user.update(params.require(:user).permit(:name, :image, :introduction))
       redirect_to users_profile_path
     else
       render "profile_edit"
     end
  end

  def destroy
  end
  
end
