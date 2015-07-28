class GooglePlacesController < ApplicationController

  GOOGLE_API_KEY = ENV['google_places_api_key']

  def self.test_run


    #arbitrary search parameters
    query = 'pizza'

    lat = 40.704628
    lon = -74.014155

    radius = 1000

    #Build API query (Multi-line for readability)
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
    url += "query=#{query}&"
    url += "location=#{lat},#{lon}&"
    url += "radius=#{radius}&"
    url += "key=#{GOOGLE_API_KEY}"


    #SSL currently only works by `curl`ing from the app (not terminal `curl` or http get from app)
    uri = URI.parse(url)

    system "curl '#{uri}' > google_response"

    results = JSON.parse(File.read("google_response"))

    # results["results"].first.each do |k,v|
    #   puts "#{k}: #{v}"
    #   puts
    # end

    #Arbitrary displaying of the data
    results["results"].map do |result|

      {
        name: result["name"],
        address: result["formatted_address"].gsub(/,[^,]+$/,""),
        google_rating: result["rating"]
      }

    end
  end
end
