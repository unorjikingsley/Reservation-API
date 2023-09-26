class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create index destroy]

  def index
    @reservations = current_user.reservations
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: { error: 'Error updating reservation' }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = current_user.reservations.find_by(id: params[:id])
    if @reservation
      @reservation.destroy
      render json: { message: 'Reservation destroyed' }, status: :ok
    else
      render json: { error: 'Reservation not found' }, status: :not_found
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :city, :user_id, :car_id)
  end
end
