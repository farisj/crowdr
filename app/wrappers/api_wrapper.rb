class ApiWrapper

  def get_data

    params = {query: 'chinese', lt: 40.728209, lg: -73.953279}
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

            r = Restaurant.new
            r.name = fy ? foursquare_hash[:name] : google_hash[:name]
            r.address = fy ? yelp_hash[:address] : google_hash [:address]
            r.yelp_rating = yelp_hash[:rating] if yg || fy
            r.foursquare_rating = foursquare_hash[:rating] if fy || gf
            r.google_rating = google_hash[:rating] if yg || gf


            if fy
              restaurants[yelp_hash[:key]] = r
            else
              restaurants[google_hash[:key]] = r
            end

          end

        end
   
      end

    end


    #console display - to be removed
    restaurants.each do |key, restaurant|

      puts "#{restaurant.name} - #{restaurant.address} - #{restaurant.google_rating} - #{restaurant.foursquare_rating} - #{restaurant.yelp_rating}"

    end

    restaurants

  end

end