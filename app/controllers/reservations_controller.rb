class ReservationsController < ApplicationController
  def index
    @user = current_user.id
    @reservations = Reservation.where(user_id: @user)
  end

  def new; end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :created_at,
                                                                       :user_id, :room_id, :reservation_number_of_people))

    if !@reservation.check_in_date.blank? && !@reservation.check_out_date.blank? &&
       !@reservation.reservation_number_of_people.blank?
      @stay_days = (@reservation.check_out_date - @reservation.check_in_date).to_i
      @total_price = @reservation.room.price * @reservation.reservation_number_of_people * @stay_days
    end

    flash[:check_in_error] = nil
    flash[:check_out_error] = nil
    flash[:check_out_past] = nil
    flash[:reservation_number_error] = nil

    # 予約時入力必須項目(チェックイン日、チェックアウト日、人数)が未入力、チェックイン>チェックアウトの場合、実行
    unless @reservation.check_in_date.blank? || @reservation.check_out_date.blank? ||
           @reservation.reservation_number_of_people.blank? || @reservation.check_in_date > @reservation.check_out_date
      return
    end

    flash[:reservation_number_error] = '人数を入力してください' if @reservation.reservation_number_of_people.blank?
    flash[:check_in_error] = 'チェックイン日を入力してください' if @reservation.check_in_date.blank?
    if @reservation.check_out_date.blank?
      flash[:check_out_error] = 'チェックアウト日を入力してください'
    elsif !@reservation.check_in_date.blank?
      if @reservation.check_in_date > @reservation.check_out_date
        flash[:check_out_past] =
          'チェックアウト日はチェックイン日よりも後の日付を選択してください'
      end
    end

    @room = Room.find_by(id: @reservation.room_id)
    render 'rooms/show'
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :created_at,
                                                                       :user_id, :room_id, :reservation_number_of_people))
    if @reservation.save
      redirect_to reservations_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  # private

  # def reservation_params
  #   @reservation_params = params.require(:reservation).permit(:check_in_date, :check_out_date, :created_at,
  #                                                             :user_id, :room_id, :reservation_number_of_people)
  # end
end
