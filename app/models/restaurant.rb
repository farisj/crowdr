class Restaurant < ActiveRecord::Base
  attr_accessor :yelp_results

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

    #YELP SEARCHING

    #Get Api keys from Figaro, and define for Yelp gem.
    def yelp_client
      @client ||= Yelp::Client.new({
        consumer_key: ENV["yelp_consumer_key"],
        consumer_secret: ENV["yelp_consumer_secret"],
        token: ENV["yelp_token"],
        token_secret: ENV["yelp_token_secret"]
        })
    end

    #Search yelp
    def yelp_search
      params = {
        limit: 10,
        sort: 2,
        radius_filter: 1000,
        category_filter: 'restaurants'
      }
      @yelp_results = {}
      #This line below is in case we decide to go back to searching by zip.
      #client.search(zipcode, params, { lang: 'en' }).businesses.collect do |business|
      coordinates = {latitude: 40.704628, longitude: -74.014155}
      #Search yelp and return hash of restaurant values.
      yelp_client.search_by_coordinates(coordinates, params, { lang: 'en' }).businesses.collect do |business|
        @yelp_results= {
          name: business.name, 
          yelp_rating: business.rating,
          image_url: business.snippet_image_url,
          categories: business.categories,
          location: "#{business.location.display_address.first}, #{business.location.display_address.last}"
        }
      end
  end

end
