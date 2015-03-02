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

    # @return [StatsRequest]
    def stats
      @stats_request ||= StatsRequest.new(api_key, region)
    end

    # @return [LeagueRequest]
    def league
      @league_request ||= LeagueRequest.new(api_key, region)
    end

    # @return [StaticRequest]
    def static
      @static_request || StaticRequest.new(api_key, region)
    end

    # @return [MatchRequest]
    def match
      @match_request ||= MatchRequest.new(api_key, region)
    end

    # @return [ChampionRequest]
    def champion
      @champion_request ||= ChampionRequest.new(api_key, region)
    end

    # Initializes a Perseus::Client
    def initialize api_key, options = {}
      @api_key = api_key
      @region = options.delete(:region) || 'eune'
    end
   
    # For Development 
    # def initialize
    #   @api_key = ENV['LOL_API_KEY']
    #   @region = 'eune'
    # end

  end
end 
