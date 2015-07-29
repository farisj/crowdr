class FoursquareWrapper

  include Normalizable::InstanceMethods

  CLIENT = Foursquare2::Client.new(:client_id => ENV["foursquare_client_id"], :client_secret => ENV["foursquare_client_secret"], :api_version => '20140806')

  def initialize(params = {query: 'pizza', lt: 40.704628, lg: -74.014155})
    @query = params[:query]
    @lt = params[:lt]
    @lg = params[:lg]
  end


  def index

    @results_hash = CLIENT.explore_venues(:ll => "#{@lt},#{@lg}", :query => @query)
    @results = []
    @results_hash.groups.first.items.select do |item|

      venue_loc = item.venue.location
      full_address = "#{venue_loc.address}, #{venue_loc.city}, #{venue_loc.state} #{venue_loc.postalCode}"
      if format_key_address(full_address) && item.venue.rating
          @results << {
                 key: format_key_address(full_address),
                 name:         item.venue.name,
                 address:     full_address, 
                 rating:     item.venue.rating
          }
      else
          nil 
      end

   end
   @results
  end

end