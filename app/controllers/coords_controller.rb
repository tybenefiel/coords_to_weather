require 'open-uri'
require 'json'

class CoordsController < ApplicationController
    def fetch_weather

    end

  def local_weather
    @address = params[:address]
    @url_safe_address = URI.encode(@address)
    @url ="http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"

    raw_data = open(@url).read
    parsed_data =JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]


    @weather_url ="https://api.forecast.io/forecast/d7bd4f49d7629dc9ddf45f2844c6a22e/#{@latitude},#{@longitude}"

    weather_raw_data = open(@weather_url).read
    weather_parsed_data =JSON.parse(weather_raw_data)
   @temperature = weather_parsed_data["currently"]["temperature"]
   @minutely_summary = weather_parsed_data["minutely"]["summary"]
   @hourly_summary = weather_parsed_data["hourly"]["summary"]
   @daily_summary = weather_parsed_data["daily"]["summary"]
  end
end
