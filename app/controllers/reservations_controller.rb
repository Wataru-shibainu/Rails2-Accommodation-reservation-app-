class ReservationsController < ApplicationController
  def index
    @user = current_user.id
    @reservation = Reservation.where(user_id: @user)
  end

  def new; end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :created_at,
                                                                       :user_id, :room_id, :reservation_number_of_people))
    flash[:check_in_date] = nil
    flash[:check_out_date] = nil
    flash[:reservation_number_of_people] = nil

    # 予約時入力必須項目(チェックイン日、チェックアウト日、人数)が未入力の場合、実行
    unless @reservation.check_in_date.blank? || @reservation.check_out_date.blank? || @reservation.reservation_number_of_people.blank?
      return
    end

    flash[:check_in_date] = 'チェックイン日を入力してください' if @reservation.check_in_date.blank?
    flash[:check_out_date] = 'チェックアウト日を入力してください' if @reservation.check_out_date.blank?
    flash[:reservation_number_of_people] = '人数を入力してください' if @reservation.reservation_number_of_people.blank?
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

  def destroy; end

  # private

  # def reservation_params
  #   @reservation_params = params.require(:reservation).permit(:check_in_date, :check_out_date, :created_at,
  #                                                             :user_id, :room_id, :reservation_number_of_people)
  # end
end
