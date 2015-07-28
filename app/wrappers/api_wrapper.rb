class ApiWrapper

  def get_data

    # preliminary 
    g = GooglePlacesWrapper.new.search
    y = YelpWrapper.new.yelp_search
    f = FoursquareWrapper.new.index

    # a = [g,y,f].map do |array|
    #   array.sort_by do | restaurant_hash | 

    #     restaurant_hash[:name]
    #   end
    # end

    # g = a[0]
    # y = a[1]
    # f = a[2]


    # puts 'google'
    # puts g

    # puts "yelp"
    # puts y

    # puts 'foursquare'
    # puts f

    generate_restaurants(g,f,y)
    #Combine magic
      #Take three hashes and .uniq them somehow
      #Match them up by address
      #if g.address == y.address && y.address == f.address
        #it's one place
      #end

    #present data
  end

  def generate_restaurants(google,foursquare,yelp)
    
    #magic

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

            if r.name == "Friendly Gourmet Pizza"
              # binding.pry
            end

            if fy
              restaurants[yelp_hash[:key]] = r
            else
              restaurants[google_hash[:key]] = r
            end
          end

        end
   
      end

    end

    #combine f-y google


    restaurants.each do |key, restaurant|

      puts "#{restaurant.name} - #{restaurant.address} - #{restaurant.google_rating} - #{restaurant.foursquare_rating} - #{restaurant.yelp_rating}"

    end
    nil
    restaurants
    #return [restaurant, restaurant2.....]
  end

end