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


    puts 'google'
    puts g

    puts "yelp"
    puts y

    puts 'foursquare'
    puts f

    generate_restaurants(g,f,y)
    #Combine magic
      #Take three hashes and .uniq them somehow
      #Match them up by address
      #if g.address == y.address && y.address == f.address
        #it's one place
      #end

    #present data
  end

  def generate_restaurants(g,f,y)
    
    #magic

    #combine foursquare yelp


    #combine f-y google



    #return [restaurant, restaurant2.....]
  end

end