require 'rest-client'
require 'sendcloud/mail'
require 'sendcloud/mail_list'
require 'sendcloud/template'
require 'sendcloud/stats'
require 'sendcloud/unsubscribes'
require 'sendcloud/bounces'
require 'sendcloud/version'

module Sendcloud

  API_BASE = 'https://sendcloud.sohu.com/apiv2'

  class Error < StandardError; end

  def self.setup
    yield self
  end

  class << self
    attr_accessor :api_user, :api_key, :format
  end

  def self.get(path, params)
    
    request(path, params) do |url, options|
      rest_get(url, {:params => options})
    end
  end

  def self.post(path, params)

    request(path, params) do |url, options|
      rest_post(url, options)
    end

  end

  def self.request(path, params, &block)
    params = {
        :apiUser => Sendcloud.api_user,
        :apiKey => Sendcloud.api_key,
    }.merge(params)

    format = params.delete(:format) || 'json'
    url = "#{API_BASE}/#{path}.#{format}"
    begin
      return JSON.parse(yield(url, params))
    rescue JSON::ParserError
      raise Sendcloud::Error.new('sendcloud response invalid')
    end

  end
  
  private 
  def self.rest_client_send method, url, options
   request =  RestClient::Request.execute(:method => method, :url => url, :verify_ssl => false, :payload => options) #, :params => options) #, {:params => options})
  end
  
  def self.rest_get url, options
    rest_client_send :get, url, options
  end
  
  def self.rest_post url, options
    rest_client_send :post, url, options
  end
end
