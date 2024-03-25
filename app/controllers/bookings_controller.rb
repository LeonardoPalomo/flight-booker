class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @quantity = params[:passengers].to_i
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passengers)
  end

end
