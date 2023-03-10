class ReservationsController < ApplicationController
  def index
    @user = current_user.id
    @reservation = Reservation.where(user_id: @user)
  end

  def new; end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :created_at,
                                                                       :user_id, :room_id, :reservation_number_of_people))
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
