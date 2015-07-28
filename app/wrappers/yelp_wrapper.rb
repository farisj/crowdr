class YelpWrapper

  include Normalizable::InstanceMethods

  attr_accessor :yelp_results

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
        term: 'pizza',
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

          key: business.name.strip.gsub(/\W/,"").downcase,
          name: business.name, 
          rating: business.rating,
          address: format_address("#{business.location.display_address.first}, #{business.location.display_address.last}")#.gsub(/\s#.+/,"")
        }
      end
  end
end