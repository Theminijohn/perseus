require 'spec_helper'
require 'perseus'

include Perseus 

describe Model do
  describe '#inspect' do
    subject { Champion.new 'id' => 212 }
    it 'skips @raw' do
      expect(subject.inspect).not_to match(/@raw/)
    end
  end
end
