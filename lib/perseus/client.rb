module Perseus
  class Client
 
    # @!attribute [rw] region
    # return [String] name of region 
    attr_accessor :region

    # @!attribute [r] api_key
    # return [String] the API key
    attr_reader :api_key

    # @return [SummonerRequest]
    def summoner
      @summoner_request ||= SummonerRequest.new(api_key, region)
    end

    # Initializes a Perseus::Client
    def initialize api_key, options = {}
      @api_key = api_key
      @region = options.delete(:region)
    end

  end
end 
