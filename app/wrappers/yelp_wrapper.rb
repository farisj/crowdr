class YelpWrapper

  include Normalizable::InstanceMethods

  attr_accessor :yelp_results

  def initialize(params = {query: 'pizza', lt: 40.704628, lg: -74.014155})

    @term = params[:query]
    @lt = params[:lt].to_f
    @lg = params[:lg].to_f
    
  end

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
      term: @term,
      limit: 20,
      sort: 2,
      radius_filter: 1000,
      category_filter: 'restaurants'
    }
    #This line below is in case we decide to go back to searching by zip.
    #client.search(zipcode, params, { lang: 'en' }).businesses.collect do |business|
    coordinates = {latitude: @lt, longitude: @lg}
    #Search yelp and return hash of restaurant values.
    yelp_client.search_by_coordinates(coordinates, params, { lang: 'en' }).businesses.collect { |business|
      if business.rating
        {

          key: format_key_address("#{business.location.display_address.first}, #{business.location.display_address.last}"),
          name: business.name, 
          rating: business.rating,
          phone: business.display_phone,
          address: "#{business.location.display_address.first}, #{business.location.display_address.last}"#.gsub(/\s#.+/,"")
        }
      end
    }.compact
  end
end