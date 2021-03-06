require 'spec_helper'
require 'perseus'

include Perseus

describe StatsRequest do
  let(:request) { StatsRequest.new("api_key", "eune") }

  it 'inherits from Request' do
    expect(StatsRequest.ancestors[1]).to eq(Request) 
  end

  describe '#summary' do
    it 'requires a summoner' do
      expect { request.summary }.to raise_error ArgumentError
    end

    it 'raises an error when unexpected parameter is received' do
      expect { request.summary '1', asd: 'foo'  }.to raise_error ArgumentError
    end

    context 'with summoner' do
      subject { request.summary(1) }

      context 'without season' do
        let(:fixture) { load_fixture('stats', StatsRequest.api_version)  }

        before(:each) { stub_request(request, 'stats', 'stats/by-summoner/1/summary') }

        it 'returns an array' do
          expect(subject).to be_a Array
        end

        it 'returns an array of PlayerStatistic' do
          expect(subject.map(&:class).uniq).to eq [PlayerStatistic]
        end

        it 'fetches PlayerStatistics from the API' do
          expect(subject.size).to eq(fixture['playerStatSummaries'].size)
        end
      end

      context 'with season' do
        before(:each) { stub_request(request, 'stats', 'stats/by-summoner/1/summary', season: '1') }

        it 'optionally acepts a season' do
          request.summary('1', season: '1')
        end
      end
    end
    
  end
end
