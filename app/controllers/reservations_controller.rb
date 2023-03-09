class ReservationsController < ApplicationController
  def index; end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date))

    if @reservation.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end
end
