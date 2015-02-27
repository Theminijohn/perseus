require 'active_support/core_ext/string/inflections'
require 'httparty'
require 'uri'

module Perseus
  # Takes a hash and returns a copy of it with the keys that have been underscored
  # This method is here but should be somewhere else, probably an helper module
  # @param [Hash] a hash with keys in camelCase format
  # @return [Hash] a copy of the original hash, with hash keys that have been underscored
  def self.underscore_hash_keys hash
    hash.inject({}) { |memo, (key, value)| memo.update key.to_s.underscore => value }
  end
end

require 'perseus/autoloader'
require 'perseus/invalid_api_response'
