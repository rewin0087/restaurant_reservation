class HomeController < ApplicationController
  def index
    @reservations = Reservation.active_and_reserved.page(params[:page])
  end
end
