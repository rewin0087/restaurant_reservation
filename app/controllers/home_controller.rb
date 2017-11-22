class HomeController < ApplicationController
  def index
    @reservations = Reservation.active_and_reserved
  end
end
