class ReservationsController < ApplicationController
  def index
    @user = current_user.id
    @reservation = Reservation.where(user_id: @user)
  end

  def new
    # @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:id])
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :created_at,
                                                                       :user_id, :room_id, :reservation_number_of_people))
    binding.pry
    if @reservation.save
      binding.pry
      redirect_to rooms_path

    else
      render 'new'
    end
  end

  def confirm
    @reservation = Reservation.find(params[:id])
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end
end
