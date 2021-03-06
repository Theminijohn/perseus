require 'spec_helper'
require 'perseus'

include Perseus

describe Champion do
  it_behaves_like 'Perseus Model' do
    let(:valid_attributes) { { id: 1 } }
  end

  %w(id active bot_enabled free_to_play bot_mm_enabled ranked_play_enabled).each do |attribute|
    describe "#{attribute} attribute" do
      it_behaves_like 'plain attribute' do
        let(:attribute) { attribute }
        let(:attribute_value) { 'asd' }
      end
    end
  end
end
