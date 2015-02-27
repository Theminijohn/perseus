require 'rspec'

SPEC_ROOT = __dir__

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |c|
  # c.fail_fast = true
  c.filter_run_excluding :remote => true
  c.include Helpers
end
