class FoursquareWrapper

  include Normalizable::InstanceMethods

  CLIENT = Foursquare2::Client.new(:client_id => ENV["foursquare_client_id"], :client_secret => ENV["foursquare_client_secret"], :api_version => '20140806')

     def index
         @results_hash = CLIENT.explore_venues(:ll => '40.704628,-74.014155', :query => 'pizza')
         @results = {}
         @results_hash.groups.first.items.select do |item|
            venue_loc = item.venue.location
            full_address = "#{venue_loc.address}, #{venue_loc.city}, #{venue_loc.state} #{venue_loc.postalCode}"
            if format_key_address(full_address)
                @results[format_key_address(full_address)] = {
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