require 'rspec'
require 'sendcloud'

RSpec.configure do |_|
  Sendcloud.setup do |config|
    config.api_user = 'xxxxx'
    config.api_key = 'yyyy'
  end
end