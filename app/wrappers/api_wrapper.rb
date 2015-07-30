class ApiWrapper

  def get_data(params = {query: 'chinese', lt: 40.728209, lg: -73.953279})

    params[:lt] = params[:lt].to_f
    params[:lg] = params[:lg].to_f
    g = GooglePlacesWrapper.new(params).search
    y = YelpWrapper.new(params).yelp_search
    f = FoursquareWrapper.new(params).index


    generate_restaurants(g,f,y)
  end

  def generate_restaurants(google,foursquare,yelp)

    restaurants = {}

    #combine foursquare yelp

    google.each do |google_hash|

      foursquare.each do |foursquare_hash|

        yelp.each do |yelp_hash|
          fyg = (foursquare_hash[:key] == yelp_hash[:key] && yelp_hash[:key] == google_hash[:key])
          fy = foursquare_hash[:key] == yelp_hash[:key]
          yg = yelp_hash[:key] == google_hash[:key]
          gf = google_hash[:key] == foursquare_hash[:key]

          if (fyg || fy || yg || gf) 

            if fy
              restaurant_key = yelp_hash[:key]
            else
              restaurant_key = google_hash[:key]
            end
            
            #Create a new restaurant if it doesn't already exist
            #Set the properties of the object in the hash from *within* the hash
            #This fixes a bug where it would overwrite itself w/o all 3 values
            #This fix definitely does do a lot of unnecessary overwriting and could be refactored.
            restaurants[restaurant_key] ||= Restaurant.new
            restaurants[restaurant_key].name = fy ? foursquare_hash[:name] : google_hash[:name]
            restaurants[restaurant_key].address = fy ? yelp_hash[:address] : google_hash [:address]
            restaurants[restaurant_key].yelp_rating = yelp_hash[:rating] if yg || fy
            restaurants[restaurant_key].foursquare_rating = foursquare_hash[:rating] if fy || gf
            restaurants[restaurant_key].google_rating = google_hash[:rating] if yg || gf

          end

        end
   
      end

    end


    #console display - to be removed
    restaurants.each do |key, restaurant|

      # puts "#{restaurant.name} - #{restaurant.address} - #{restaurant.google_rating} - #{restaurant.foursquare_rating} - #{restaurant.yelp_rating}"

    end

    restaurants

  end

end