class Restaurant

  attr_accessor :key, :name, :address, :google_rating, :yelp_rating, :foursquare_rating, :phone, :snippet_text

  #Object to contain pertinent data to be used later in controller
  #ApiWrapper will create many of these objects
  def average_rating
    ((self.google_rating.to_f*2 + self.foursquare_rating.to_f + self.yelp_rating.to_f*2)/((1 if self.google_rating.to_i > 0).to_i + (1 if self.foursquare_rating.to_i > 0).to_i + (1 if self.yelp_rating.to_i > 0).to_i)*10).round
  end

  def do_people_like_it
    if self.average_rating > 80
      "People Love It!"
    elsif self.average_rating > 70
      "It's Just Okay."
    else
      "Meh."
    end

  end

end