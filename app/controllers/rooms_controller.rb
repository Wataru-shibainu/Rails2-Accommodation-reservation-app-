class RoomsController < ApplicationController
  #  ホーム画面、検索フォーム入力情報の受け渡し
  # area_search,keyword_searchはroom.rbで定義
  def home
    @area = Room.area_search(params[:area])
    @keyword = Room.keyword_search(params[:keyword])
    @tokyo = Room.where('address like ?', '%東京%')
  end

  #  検索結果の受け取り、表示
  def search_result
    @area = Room.area_search(params[:area])
    @keyword = Room.keyword_search(params[:keyword])

    @area_and_keyword = if @area.blank? && @keyword.blank?
                          nil
                        elsif @area.blank?
                          @keyword
                        elsif @keyword.blank?
                          @area
                        else
                          (@area + @keyword).uniq
                        end

    return unless !@area.blank? || !@keyword.blank?

    @number_of_searchs = @area_and_keyword.size
  end

  def index
    @rooms = Room.all
    @number_of_rooms = @rooms.size
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:hotel_name, :hotel_detail, :price, :address, :hotel_image, :user_id))

    if @room.save
      redirect_to rooms_own_path
    else
      render 'new'
    end
  end

  #  各ログインユーザーが登録した施設全てを表示
  def own
    @user = current_user.id
    @rooms = Room.where(user_id: @user)
  end

  # 各ログインユーザーが登録した施設の詳細を表示
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:hotel_name, :hotel_detail, :price, :address, :hotel_image))
      redirect_to room_path
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_own_path
  end
end
