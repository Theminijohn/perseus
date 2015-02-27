module Perseus
  class StatsRequest < Request

    # Return the support API Version
    # @return [String] the supported API version
    def self.api_version
      'v1.3'
    end

    # Retrieve player Statistics summary for the given summoner
    # @param [String] summoner_id
    # @return [Array] an array of player statistics, one per queue type
    def summary summoner_id, extra = {}
      if extra.keys.select { |k| k.to_sym != :season }.any?
        raise ArgumentError, 'Only :season is allowed as an extra parameter'
      end
      stats_api_path = "stats/by-summoner/#{summoner_id}/summary"
      perform_request(api_url(stats_api_path))['playerStatSummaries'].map do |player_stat_data|
        PlayerStatistic.new player_stat_data
      end
    end

    # Retrieve ranked statistics summary for the given summoner
    # @param [String] summoner_id
    # @return [RankedStatisticSummary] Ranked Stats
    #   includes stats for Twisted Treeline and Summoner's Rift
    def ranked summoner_id, extra = {}
      if extra.keys.select { |k| k.to_sym != :season  }.any?
        raise ArgumentError, 'Only :season is allowed as an extra parameter'
      end
      stats_api_path = "stats/by-summoner/#{summoner_id}/ranked"
      RankedStatisticsSummary.new perform_request api_url stats_api_path, extra
    end

  end
end
