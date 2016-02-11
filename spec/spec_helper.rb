require 'rspec'
require 'sendcloud'

RSpec.configure do |_|
  Sendcloud.setup do |config|
    config.api_user = 'mail_chilaoshi'
    config.api_key = 'dvB7ft2bdUavgYMW'
  end
end