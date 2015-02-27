module Helpers

  def underscore(s)
    s.to_s.scan(/[A-Z][a-z]*/).join("_").downcase
  end

  def camelize(s)
    s[0] + s.to_s.split("_").each {|s| s.capitalize! }.join("")[1..-1]
  end

  def expect_init_attribute(subject, attribute)
    expect(subject.new(camelize(attribute) => "foo").send(attribute)).to eq("foo")
  end

  def expect_read_only_attribute(subject, attribute)
    expect { subject.new.send("#{attribute}=".to_sym, "bar")  }.to raise_error(NoMethodError)
  end

  def error_401
    response = { 'status' => { 'message' => 'foo', 'status_code' => 401 } }
    response.send :instance_eval do
      def code; 401; end
      def not_found?; false; end
    end
    response
  end

  def summoners
    {
      'euw' => '30743211',
      'na'  => '20964624',
      'eune' => '27683954'
    }
  end

end
