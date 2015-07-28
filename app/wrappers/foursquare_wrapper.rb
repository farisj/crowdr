class FoursquareWrapper

  include Normalizable::InstanceMethods

  CLIENT = Foursquare2::Client.new(:client_id => ENV["foursquare_client_id"], :client_secret => ENV["foursquare_client_secret"], :api_version => '20140806')

     def index
         @results_hash = CLIENT.explore_venues(:ll => '40.704628,-74.014155', :query => 'pizza')
         @results = @results_hash['groups'][0]['items'].collect do |item| 
             {
                  key:        item['venue']['name'].strip.gsub(/\W/,"").downcase,
                 name:         item['venue']['name'],
                 address:     format_address("#{item['venue']['location']['address']}, #{item['venue']['location']['city']}, #{item['venue']['location']['state']} #{item['venue']['location']['postalCode']}"), 
                 rating:     item['venue']['rating']
             }
         end
   end

end