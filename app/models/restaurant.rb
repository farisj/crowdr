class Restaurant < ActiveRecord::Base

  GOOGLE_API_KEY = ENV['google_places_api_key']

  def get_data

    # preliminary 
    # g = search_google
    # y = search_yelp
    # f = search_f4sqr

    #Combine magic
      #Take three hashes and .uniq them somehow
      #Match them up by address
      #if g.address == y.address && y.address == f.address
        #it's one place
      #end

    #present data
  end

  private
    def search_google

      #arbitrary search parameters (for now)
      query = 'pizza'

      lat = 40.704628
      lon = -74.014155

      radius = 1000 #in meters

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

      #Format data
      results["results"].map do |result|

        {
          name: result["name"],
          address: result["formatted_address"].gsub(/,[^,]+$/,""),
          google_rating: result["rating"]
        }

      end
    end

end
