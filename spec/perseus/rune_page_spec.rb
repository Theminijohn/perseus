require 'spec_helper'
require 'perseus'

include Perseus

describe RunePage do
  it_behaves_like 'Perseus Model' do
    let(:valid_attributes) { { id: 1 } }
  end

  %w(id name current).each do |attribute|
    it_behaves_like 'plain attribute' do
      let(:attribute) { attribute }
      let(:attribute_value) { 'asd' }
    end
  end

  describe '#slots' do
    let(:fixture) { load_fixture('summoner-runes', SummonerRequest.api_version) }
    let(:slots) { fixture['27683954']['pages'].first['slots'] }

    subject { RunePage.new fixture['27683954']['pages'].first }

    it 'is populated by all slots' do
      expect(subject.slots.size).to eq(slots.size)
    end
  end

end
