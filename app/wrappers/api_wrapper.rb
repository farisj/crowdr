class ApiWrapper

  def get_data(params = {query: 'chinese', lt: 40.728209, lg: -73.953279})

    params[:lt] = params[:lt].to_f
    params[:lg] = params[:lg].to_f
    # g = GooglePlacesWrapper.new(params).search
    # y = YelpWrapper.new(params).yelp_search
    # f = FoursquareWrapper.new(params).index

    g = [{:key=>"151greenpointave,brooklyn", 
      :name=>"Chinese Musician", :address=>"151 Greenpoint Avenue, Brooklyn, NY 11222, United States", :rating=>3.5}, 
      {:key=>"954manhattanave,brooklyn", :name=>"Great Wall", :address=>"954 Manhattan Avenue, Brooklyn, NY 11222, United States", :rating=>4.2}, 
      {:key=>"157franklinst,brooklyn", :name=>"Shanghai Lee", :address=>"157 Franklin Street, Brooklyn, NY 11222, United States", :rating=>3.8}, 
      {:key=>"611manhattanave,brooklyn", :name=>"Fortune Cookies", :address=>"611 Manhattan Avenue, Brooklyn, NY 11222, United States", :rating=>3.7}, {:key=>"146nassauave,brooklyn", :name=>"Wah Kwoon Chinese Kitchen", :address=>"146 Nassau Avenue, Brooklyn, NY 11222, United States", :rating=>3.8}, {:key=>"237nassauave,brooklyn", :name=>"Peking Express", :address=>"237 Nassau Avenue, Brooklyn, NY 11222, United States", :rating=>4.3}, {:key=>"167nassauave,brooklyn", :name=>"Lucky Luna", :address=>"167 Nassau Avenue, Brooklyn, NY 11222, United States", :rating=>3.3}, {:key=>"208bedfordave,brooklyn", :name=>"Red Bowl Chinese Restaurant", :address=>"208 Bedford Avenue, Brooklyn, NY 11211, United States", :rating=>4}, {:key=>"292grandst,brooklyn", :name=>"M Shanghai Bistro & Garden", :address=>"292 Grand Street, Brooklyn, NY 11211, United States", :rating=>4.1}, {:key=>"549metropolitanave,brooklyn", :name=>"M Noodle Shop", :address=>"549 Metropolitan Avenue, Brooklyn, NY 11211, United States", :rating=>3.9}, {:key=>"394metropolitanave,brooklyn", :name=>"Golden Dragon Kitchen", :address=>"394 Metropolitan Avenue, Brooklyn, NY 11211, United States", :rating=>4.3}, {:key=>"631grandst,brooklyn", :name=>"Hachi Asian Bistro", :address=>"631 Grand Street, Brooklyn, NY 11211, United States", :rating=>4}, {:key=>"7112ndave,newyork", :name=>"Six Happiness", :address=>"711 2nd Avenue, New York, NY 10016, United States", :rating=>3.7}, {:key=>"752metropolitanave,brooklyn", :name=>"East Met West", :address=>"752 Metropolitan Avenue, Brooklyn, NY 11211, United States", :rating=>3.8}, {:key=>"172grandst,brooklyn", :name=>"Kam Sing Chinese Restaurant", :address=>"172 Grand Street, Brooklyn, NY 11211, United States", :rating=>2.8}, {:key=>"4720centerblvd,longislandcity", :name=>"SHI", :address=>"4720 Center Boulevard, Long Island City, NY 11109, United States", :rating=>3.8}]

    y = [{:key=>"1073manhattanave,brooklyn", :name=>"Lobster Joint", :rating=>4.0, :address=>"1073 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"648manhattanave,brooklyn", :name=>"Xi'an Famous Foods", :rating=>4.0, :address=>"648 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"617manhattanave,brooklyn", :name=>"Amarin Cafe", :rating=>4.0, :address=>"617 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"146nassauave,brooklyn", :name=>"Wah Kwoon Chinese Kitchen", :rating=>3.5, :address=>"146 Nassau Ave, Brooklyn, NY 11222"}, {:key=>"622manhattanave,brooklyn", :name=>"Sapporo Ichiban", :rating=>4.0, :address=>"622 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"992manhattanave,brooklyn", :name=>"Hop Lee Kitchen", :rating=>4.0, :address=>"992 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"651manhattanave,greenpoint", :name=>"Xi'an Famous Foods", :rating=>4.5, :address=>"651 Manhattan Ave, Greenpoint, NY 11222"}, {:key=>"970manhattanave,brooklyn", :name=>"OTT Authentic Thai Cuisine", :rating=>3.5, :address=>"970 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"837manhattanave,brooklyn", :name=>"Sakura 6", :rating=>3.5, :address=>"837 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"611manhattanave,brooklyn", :name=>"Fortune Cookie Chinese Kitchen", :rating=>3.5, :address=>"611 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"1030manhattanave,brooklyn", :name=>"Green Leaves Chinese Restaurant", :rating=>3.5, :address=>"1030 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"638manhattanave,brooklyn", :name=>"Wasabi", :rating=>3.0, :address=>"638 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"954manhattanave,brooklyn", :name=>"Great Wall No 1", :rating=>3.5, :address=>"954 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"151greenpointave,brooklyn", :name=>"Chinese Musician Restaurant", :rating=>3.0, :address=>"151 Greenpoint Ave, Brooklyn, NY 11222"}, {:key=>"925manhattanave,brooklyn", :name=>"Thai Cafe", :rating=>3.0, :address=>"925 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"1030manhattanave,brooklyn", :name=>"Green Leaf Chinese Restaurant", :rating=>2.5, :address=>"1030 Manhattan Avenue, Brooklyn, NY 11222"}, {:key=>"681manhattanave,brooklyn", :name=>"Erb Thai", :rating=>2.5, :address=>"681 Manhattan Ave, Brooklyn, NY 11222"}, {:key=>"157franklinst,brooklyn", :name=>"Shanghai Lee", :rating=>3.0, :address=>"157 Franklin St, Brooklyn, NY 11222"}, {:key=>"685manhattanave,brooklyn", :name=>"Lollipop", :rating=>2.5, :address=>"685 Manhattan Ave, Brooklyn, NY 11222"}]

    f = [{:key=>"648manhattanave,brooklyn", :name=>"Xi'an Famous Foods", :address=>"648 Manhattan Ave, Brooklyn, NY 11222", :rating=>8.8}, {:key=>"157franklinst,brooklyn", :name=>"Shang Hai Lee", :address=>"157 Franklin St, Brooklyn, NY 11222", :rating=>7.2}, {:key=>"151greenpointave,brooklyn", :name=>"Chinese Musician Restaurant", :address=>"151 Greenpoint Ave, Brooklyn, NY 11222", :rating=>6.8}, {:key=>"20skillmanave,brooklyn", :name=>"Kings County Imperial", :address=>"20 Skillman Ave, Brooklyn, NY 11211", :rating=>8.7}, {:key=>"292grandst,brooklyn", :name=>"M Shanghai Bistro", :address=>"292 Grand St, Brooklyn, NY 11211", :rating=>8.7}, {:key=>"182n10thst,brooklyn", :name=>"Brooklyn Wok Shop", :address=>"182 N 10th St, Brooklyn, NY 11211", :rating=>6.9}, {:key=>"187grandst,brooklyn", :name=>"Snacky", :address=>"187 Grand St, Brooklyn, NY 11211", :rating=>8.3}, {:key=>"549metropolitanave,brooklyn", :name=>"M Noodle Shop", :address=>"549 Metropolitan Ave, Brooklyn, NY 11211", :rating=>7.6}, {:key=>"208bedfordave,brooklyn", :name=>"Red Bowl", :address=>"208 Bedford Ave, Brooklyn, NY 11249", :rating=>7.3}, {:key=>"146nassauave,brooklyn", :name=>"Wah Kwoon Kitchen", :address=>"146 Nassau Ave, Brooklyn, NY 11222", :rating=>6.2}, {:key=>"79berryst,brooklyn", :name=>"Cafe Colette", :address=>"79 Berry St, Brooklyn, NY 11249", :rating=>8.8}, {:key=>"502grandst,brooklyn", :name=>"New Apolo Restaurant", :address=>"502 Grand St, Brooklyn, NY 11211", :rating=>7.6}, {:key=>"4720centerblvd,queens", :name=>"SHI", :address=>"4720 Center Blvd, Queens, NY 11109", :rating=>8.6}, {:key=>"172grandst,brooklyn", :name=>"Kam Sing", :address=>"172 Grand St, Brooklyn, NY 11211", :rating=>6.7}, {:key=>"135kentave,brooklyn", :name=>"Sweetleaf", :address=>"135 Kent Ave, Brooklyn, NY 11249", :rating=>8.7}, {:key=>"2331stave,newyork", :name=>"Mee Noodle Shop", :address=>"233 1st Ave, New York, NY 10003", :rating=>8.2}, {:key=>"395metropolitanave.,brooklyn", :name=>"Golden Dragon", :address=>"395 Metropolitan Ave., Brooklyn, NY 11222", :rating=>6.7}, {:key=>"167nassau,brooklyn", :name=>"Lucky Luna", :address=>"167 Nassau, Brooklyn, NY 11222", :rating=>7.7}, {:key=>"50kentave,brooklyn", :name=>"Brooklyn Flea - Williamsburg", :address=>"50 Kent Avenue, Brooklyn, NY 11211", :rating=>8.7}]


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


            if restaurants[restaurant_key]

              #Update restaurant
              restaurants[restaurant_key].yelp_rating = yelp_hash[:rating] if yg || fy
              restaurants[restaurant_key].foursquare_rating = foursquare_hash[:rating] if fy || gf
              restaurants[restaurant_key].google_rating = google_hash[:rating] if yg || gf

            else
              #Create new Restaurant
              r = Restaurant.new
              r.name = fy ? foursquare_hash[:name] : google_hash[:name]
              r.address = fy ? yelp_hash[:address] : google_hash [:address]
              r.yelp_rating = yelp_hash[:rating] if yg || fy
              r.foursquare_rating = foursquare_hash[:rating] if fy || gf
              r.google_rating = google_hash[:rating] if yg || gf
              r.phone = yelp_hash[:phone] 
              r.snippet_text = yelp_hash[:snippet_text]
              restaurants[restaurant_key] = r


            end
            
          end

        end
   
      end

    end

    restaurants

  end
end

