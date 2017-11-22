class ReservationsController < ApplicationController
  before_filter :set_reservation, only: [:edit, :show, :update, :destroy]

  def index
    @reservation = Reservation.new
    @date_time = Time.now.strftime('%Y-%m-%d %H:%M')
    @seats = 0
    @tables = Table.find_vacants(@date_time, @seats)
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.valid? && @reservation.save
      redirect_to edit_reservation_path(@reservation), notice: "Reservation for #{@reservation.table.name} created."
    else
      flash.now[:error] = 'Failed to create reservation. Please check errors below.'
      render :new
    end
  end

  def show
  end

  def edit
    @tables = available_tables
  end

  def update
    @reservation.assign_attributes(reservation_params)

    if @reservation.valid? && @reservation.save
      redirect_to reservations_path, notice: "Reservation for #{@reservation.table.name} got updated."
    else
      flash.now[:error] = 'Failed to update reservation. Please check errors below.'
      @tables = available_tables
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, notice: "Reservation for #{@reservation.table.name} got deleted."
  end

  private

  def available_tables
    @reservation.table.present? ? [@reservation.table] : Table.all
  end

  def set_reservation
    @reservation = Reservation.find params[:id]
  end

  def reservation_params
    params.require(:reservation).permit(:name, :seats, :date_time, :status, :table_id)
  end
end
