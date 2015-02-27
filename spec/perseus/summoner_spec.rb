require 'spec_helper'
require 'perseus'

include Perseus

describe Summoner do
  it_behaves_like 'Perseus Model' do
    let(:valid_attributes) { { id: 1 } }
  end

  %w(id name profile_icon_id revision_date revision_date_str summoner_level).each do |attribute|
    describe "#{attribute} attribute" do
      it_behaves_like 'plain attribute' do
        let(:attribute) { attribute }
        let(:attribute_value) { 'tmj' }
      end
    end
  end

end
