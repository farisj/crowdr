class Restaurant

  attr_accessor :key, :name, :address, :google_rating, :yelp_rating, :foursquare_rating

  #Object to contain pertinent data to be used later in controller
  #ApiWrapper will create many of these objects

  # @@all = []

  # def self.all
  #   @@all
  # end

  # def initialize
  #   @@all << self
  # end

  geocoded_by :ip_address,
  :latitude => :lat, :longitude => :lon
  after_validation :geocode

end