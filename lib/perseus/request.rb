require 'uri'
require 'active_support/core_ext/object/to_query'

module Perseus
  # class NotFound < StandardError; end

  # Encapsulates common methods for all requests
  # Request classes inherit from this
  class Request
    include HTTParty    

    # @!attribute [r] api_key
    # @return [String] api_key
    attr_reader :api_key

    # @!attribute [rw] region
    # @return [String] region
    attr_accessor :region

    # Stub method. Each subclass should have its own api version
    # @return [String] api version
    def self.api_version
      "v1.4"
    end

    # Returns a full url for an API call
    # @param path [String] API path to call
    # @return [String] full fledged url
    def api_url path, params = {}
      url = "#{api_base_url}/api/lol/#{region}/#{self.class.api_version}/#{path}"
      "#{url}?#{api_query_string params}"
    end

    def api_base_url
      "https://#{region}.api.pvp.net"
    end

    def api_query_string params = {}
      URI.encode_www_form params.merge api_key: api_key
    end

    # Returns just a path from a full api url
    # @return [String]
    def clean_url(url)
      uri = URI.parse(url)
      uri.query = CGI.parse(uri.query).reject { |k| k == 'api_key' }.to_query
      uri.to_s
    end

    # Calls the API via HTTParty and handles errors
    # @param url [String] the url to call
    # @return [String] raw response of the call
    def perform_request url
      response = self.class.get(url)
      if response.respond_to?(:code) && !(200..300).include?(response.code)
        raise NotFound.new("404 Not Found") if response.not_found?
        raise InvalidAPIResponse.new(url, response)
      end

      response
    end

    # Initializes a new Request
    # @param api_key [String] the Riot Games API key
    # @param region [String] the region you want to use in API calls
    # @return [Request]
    def initialize api_key, region
      @api_key = api_key
      @region = region 
    end

  end
end
