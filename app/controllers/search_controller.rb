class SearchController < ApplicationController
  def index
    starting_loc = params[:location]

    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["NREL-API-KEY"] = ENV['NREL_API_KEY']
    end

    response = conn.get("/api/alt-fuel-stations/v1.json?location=#{starting_loc}limit=1&api_key=#{ENV['NREL_API_KEY']}")

    json = JSON.parse(response.body, symbolize_names: true)

  end
end
