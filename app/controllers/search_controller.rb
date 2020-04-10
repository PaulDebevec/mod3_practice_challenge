class SearchController < ApplicationController
  def index
    starting_loc = params[:location]

    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["NREL-API-KEY"] = ENV['NREL_API_KEY']
    end

    response = conn.get("/api/alt-fuel-stations/v1.json?location=#{starting_loc}&api_key=#{ENV['NREL_API_KEY']}&limit=1")
    json = JSON.parse(response.body, symbolize_names: true)

    @station = json[:fuel_stations][0]
  end
end
