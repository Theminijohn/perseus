require 'spec_helper'
require 'perseus'

include Perseus

describe SummonerRequest do
  it 'inherits from Request' do
    expect(SummonerRequest.ancestors[1]).to eq(Request)
  end

  let(:request) { SummonerRequest.new('api_key', 'eune')  }

  describe '#by_name' do

    context 'regular arguments' do
      subject { request.by_name(['foo', 'bar']) }

      before(:each) { stub_request(request, 'summoner-by-name', 'summoner/by-name/foo,bar') }

      it "returns an array" do
        expect(subject).to be_a(Array)
      end

      it "returns an array of summoners" do
        expect(subject.map(&:class).uniq).to eq([Summoner])
      end
    end

  end

  
end
