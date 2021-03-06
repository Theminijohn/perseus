require 'perseus/model'

module Perseus
  class ChampionStatisticsSummary < Perseus::Model
    # @!attribute [r] id
    # @return [Fixnum] Champion Id
    attr_reader :id

    # @!attribute [r] name
    # @return [String] Champion Name
    attr_reader :name

    # @!attribute [r] stats
    # @return [Array] List of stats associated with this champion
    attr_reader :stats

  private

    attr_writer :id, :name

    def stats= value
      @stats = value.is_a?(Hash) && OpenStruct.new(Perseus.underscore_hash_keys value) || value
    end
  end
end
