module Perseus
  class SummonerRequest < Request

    # Looks for a summoner name and returns the associated summoner
    # @param [Array] summoner names
    # @return [Array] matching summoners
    def by_name *names
      escaped_names = names.flatten.map { |name| CGI.escape name.downcase.gsub(/\s/, '') }
      perform_request(api_url("summoner/by-name/#{escaped_names.join(",")}")).map do |key, data|
        Summoner.new data
      end
    end
    
    # Get a list of summoners by summoner ID
    # @param [Array] summoner_ids
    # @return [Array] matching summoners 
    def get *summoner_ids
      perform_request(api_url("summoner/#{summoner_ids.join(",")}")).map do |key, data|
        Summoner.new data
      end
    end

  end 
end
