module Perseus
  class Summoner < Model
  
    # @!attribute [r] id
    # @return [String]
    attr_reader :id

    # @!attribuet [r] name
    # @return [String] Summoner Name
    attr_reader :name

    # @!attribute [r] profile_icon_id
    # @return [String] Id of the profile icon
    attr_reader :profile_icon_id

    # @!attribuet [r] revision_date
    # @return [Time] Last date of summoner profile revision
    attr_reader :revision_date

    # @!attribute [r] revision_date_str
    # @return [String] Human readable string of revision date
    attr_reader :revision_date_str

    # @!attribute [r] summoner_level
    # @return [Numeric] Summoner Level 1-30
    attr_reader :summoner_level

  private

    attr_writer :id, :name, :profile_icon_id, :summoner_level, :revision_date_str

    def revision_date= value
      @revision_date = valie.is_a?(Numeric) && Time.at(value / 1000) || value
    end

  end
end
