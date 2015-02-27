module Perseus
  class MatchRequest < Request
    # Returns the support API Version
    # @return [String] the supported api version
    def self.api_version
      'v2.2'
    end

    # Returns a match with the given id
    # @param match_id [Fixnum] Match Id
    # @return [Hash] match object
    def get match_id
      perform_request(api_url("match/#{match_id}"))
    end
  end
end
