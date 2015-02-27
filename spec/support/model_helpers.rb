shared_examples 'attribute' do
  let(:setter) { "#{attribute}=" }

  it 'is read only' do
    expect(subject).to_not respond_to setter
  end
end

shared_examples 'Perseus Model' do
  let(:subject_class) { subject.class }

  describe '#new' do
    it 'takes an option hash as argument' do
      expect { subject_class.new valid_attributes  }.not_to raise_error
    end
    it 'raises an error if an attribute is not allowed' do
      expect { subject_class.new({:foo => :bar}) }.to raise_error NoMethodError
    end
    it 'sets the given option hash as #raw' do
      expect(subject_class.new(valid_attributes).raw).to eq valid_attributes
    end
  end

  describe '#raw' do
    it_behaves_like 'attribute' do
      let(:attribute) { 'raw' }
    end
  end
end

shared_examples 'plain attribute' do
  let(:subject_class) { subject.class }
  let(:setter) { "#{attribute}=" }

  it_behaves_like 'attribute'

  context 'during #new' do
    it 'is set if the has contains the attribute name "underscored"' do
      model = subject_class.new attribute => attribute_value
      expect(model.send attribute).to eq attribute_value
    end

    it 'is set if the hash contains the attribute name "camelized"' do
      model = subject_class.new camelize(attribute) => attribute_value
      expect(model.send attribute).to eq attribute_value
    end
  end

end
