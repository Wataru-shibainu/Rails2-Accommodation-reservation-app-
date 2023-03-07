class RoomsController < ApplicationController
  
  def home
  end
  
  def after_login
  end
  
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:hotel_name, :hotel_detail, :price, :address, :hotel_image, :user_id))
   
    if @room.save
      redirect_to rooms_own_path
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end
  
#  各ログインユーザーが登録した施設を表示
  def own
    @user = current_user.id
    @rooms = Room.where(user_id: @user)
  end
  
  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:hotel_name, :hotel_detail, :price, :address, :hotel_image))
      redirect_to room_path
    else
      render "edit"
    end
    
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_own_path
  end

end
