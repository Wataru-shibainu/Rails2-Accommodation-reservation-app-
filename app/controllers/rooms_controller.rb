class RoomsController < ApplicationController
  
#  ransackメソッドによる情報の検索
  def home
    @q = Room.ransack(params[:q])
  end
  
#  検索結果の受け取り、表示
  def search_result
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
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
