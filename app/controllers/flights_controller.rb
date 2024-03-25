class FlightsController < ApplicationController
  
  
  def index
    @airport_options = Airport.all.map{ |a| [a.code, a.id] }
    @passengers_options = (1..4).map{ |x| [x.to_s, x]}
    p "FLIGHT PARAMS"
    p flight_params
    if flight_params.empty?
      @search_results = []
    else
      @search_results = Flight.where(
      {
        departure_airport: params[:departure_airport],
        arrival_airport: params[:arrival_airport],
      }
      ).where("flight_date >= ? AND flight_date <= ?", params[:flight_date].to_datetime.beginning_of_day, params[:flight_date].to_datetime.end_of_day)
    end
    @flights = Flight.all

    @dates_options = @flights.order(:flight_date).map{ |flight| [flight.flight_date.strftime("%d %b %y"), flight.flight_date.to_date] }
  end

  def show
  end

  def new
    @airport_options = Airport.all.map{ |a| [a.code, a.id] }
    @flight = Flight.new
  end

  private
    def flight_params
      params.permit(:departure_airport, :arrival_airport, :flight_date, :passengers)
    end

end
