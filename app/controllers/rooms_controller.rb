class RoomsController < ApplicationController
  
#  ホーム画面、検索フォーム入力情報の受け渡し
  def home
    @area = Room.area_search(params[:area])
    @keyword = Room.keyword_search(params[:keyword])
  end
   
#  検索結果の受け取り、表示
  def search_result

#検索関連
    @area = Room.area_search(params[:area])
    @keyword = Room.keyword_search(params[:keyword])
    
    if @area == nil && @keyword == nil
      @area_and_keyword = nil
    elsif @area == nil
      @area_and_keyword = @keyword
    elsif @keyword == nil
      @area_and_keyword = @area
    else
      @area_and_keyword = (@area+ @keyword).uniq
    end
    
#    @rooms = Room.find(params[:id])
    
  end
  
  
  def index
    @rooms = Room.all
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

#各ログインユーザーが登録した施設の詳細を表示
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
