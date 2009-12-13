require File.join(File.dirname(__FILE__), '..', 'cawd.rb')

require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'mocha'

Spec::Runner.configure do |config|

  config.mock_with :mocha

end

