module Normalizable

  module InstanceMethods

    def format_address(address)

      original = address
      last_word = ""
      address = address.gsub(/,[^,]+$/,"").gsub(/\s#.+/,"")


      # binding.pry
      if address.split(",").first.split(" ").last

        last_word = address.split(",").first.split(" ").last.downcase

      # else

      #   binding.pry

      end

      suffixes = Suffix.suffixes
      if suffixes.include?(last_word)
        address.gsub(last_word,suffixes[last_word])
      end

      address
      
    end

  end

end