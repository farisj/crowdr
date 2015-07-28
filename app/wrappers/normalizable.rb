module Normalizable

  module InstanceMethods

    def format_key_address(address)

      original = address
      last_word = ""
      address = address.gsub(/,[^,]+$/,"").gsub(/\s# ?\d+,/,",")


      # binding.pry
      if address.split(",").first.split(" ").last

        last_word = address.split(",").first.split(" ").last.downcase

      else

        return nil

      end

      suffixes = Suffix.suffixes
      if suffixes.keys.map{|k|k.to_s}.include?(last_word)
        # binding.pry
        address = address.gsub(last_word.capitalize,suffixes[last_word.to_sym])
      end

      address.downcase.gsub(" ","")
      
    end

  end

end