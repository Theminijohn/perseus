require 'spec_helper'
require 'perseus'

include Perseus

describe Client do
  subject { Client.new 'foo' }

  describe '#new' do
    it 'requires an API key argument' do
      expect { Client.new }.to raise_error(ArgumentError)
    end

    it 'accepts a region argument' do
      expect { Client.new('foo', region: 'eune') }.not_to raise_error
    end

    it 'defaults on EUNE as a region' do
      expect(subject.region).to eq('eune')
    end
  end

  describe '#champion' do
    it 'returns an instance of ChampionRequest' do
      expect(subject.champion).to be_a(ChampionRequest)
    end

    it 'initializes the ChampionRequest with the current API key and region' do
      expect(ChampionRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.champion
    end
  end

  xdescribe '#game' do
    it 'returns an instance of GameRequest' do
      expect(subject.game).to be_a(GameRequest)
    end

    it 'initializes the GameRequest with the current API key and region' do
      expect(GameRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.game
    end
  end

  describe '#match' do
    it 'returns an instance of MatchRequest' do
      expect(subject.match).to be_a(MatchRequest)
    end

    it 'initializes the MatchRequest with the current API key and region' do
      expect(MatchRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.match
    end
  end

  describe '#stats' do
    it 'returns an instance of StatsRequest' do
      expect(subject.stats).to be_a(StatsRequest)
    end

    it 'initializes the StatsRequest with the current API key and region' do
      expect(StatsRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.stats
    end
  end

  describe '#team' do
    it 'returns an instance of TeamRequest' do
      expect(subject.team).to be_a(TeamRequest)
    end

    it 'initializes the TeamRequest with the current API key and region' do
      expect(TeamRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.team
    end
  end

  describe '#league' do
    it 'returns an instance of LeagueRequest' do
      expect(subject.league).to be_a(LeagueRequest)
    end

    it 'initializes the LeagueRequest with the current API key and region' do
      expect(LeagueRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.league
    end
  end

  describe '#summoner' do
    it 'returns an instance of SummonerRequest' do
      expect(subject.summoner).to be_a(SummonerRequest)
    end

    it 'initializes the SummonerRequest with the current API key and region' do
      expect(SummonerRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.summoner
    end
  end

  describe '#static' do
    it 'returns an instance of StaticRequest' do
      expect(subject.static).to be_a(StaticRequest)
    end

    it 'initializes the StaticRequest with the current API key and region' do
      expect(StaticRequest).to receive(:new).with(subject.api_key, subject.region)

      subject.static
    end
  end

  xdescribe '#lol_status' do
    it 'return an instance of LolStatusRequest' do
      expect(subject.lol_status).to be_a(LolStatusRequest)
    end
  end

  xdescribe '#current_game' do
    it 'returns an instance of CurrentGameRequest' do
      expect(subject.current_game).to be_a CurrentGameRequest
    end

    it 'initializes CurrentGameRequest with the current API key an region' do
      expect(CurrentGameRequest).to receive(:new).with subject.api_key, subject.region
      subject.current_game
    end

    it 'memoizes the result' do
      expect(CurrentGameRequest).to receive(:new).and_return(double).exactly(:once)
      2.times { subject.current_game }
    end
  end

  xdescribe '#featured_games' do
    it 'returns an instance of FeaturedGamesRequest' do
      expect(subject.featured_games).to be_a FeaturedGamesRequest
    end

    it 'initializes FeaturedGamesRequest with the current API key an region' do
      expect(FeaturedGamesRequest).to receive(:new).with subject.api_key, subject.region
      subject.featured_games
    end

    it 'memoizes the result' do
      expect(FeaturedGamesRequest).to receive(:new).and_return(double).exactly(:once)
      2.times { subject.featured_games }
    end
  end

  describe '#api_key' do
    it 'returns an api key' do
      expect(subject.api_key).to eq('foo')
    end

    it 'is read_only' do
      expect { subject.api_key = 'bar' }.to raise_error(NoMethodError)
    end
  end

  describe '#region' do
    it 'returns current region' do
      expect(subject.region).to eq('eune')
    end

    it 'can be set to a new region' do
      subject.region = 'NA'
      expect(subject.region).to eq('NA')
    end
  end

end
