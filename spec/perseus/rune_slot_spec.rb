require 'spec_helper'
require 'perseus'

include Perseus

describe RuneSlot do
  it_behaves_like 'Perseus Model' do
    let(:valid_attributes) { { id: 1 } }
  end

  it_behaves_like 'plain attribute' do
    let(:attribute) { 'id' }
    let(:attribute_value) { 'tmj' }
  end

end
