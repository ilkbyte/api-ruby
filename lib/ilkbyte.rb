require "ilkbyte/version"
require 'httpclient'
require 'json'

module Ilkbyte
  class Error < StandardError; end
  class Base
    $baseUrl = "https://api.ilkbyte.com"
    def setOption(access,secret)
      $option = {"access" => access,"secret" => secret}
    end
    def request(url = nil, param = {})
      @query = {"access" => $option["access"],"secret" => $option["secret"]}
      param.each do |key,value|
        @query.store(key,value)
      end
      apiUrl = $baseUrl + url
      begin
        client = HTTPClient.new
        response = client.get(apiUrl,@query)
        JSON.parse(response.body)
      rescue StandardError => e  
        response = {
          "status" => false,
          "response" => nil,
          "message" => e.message
        }    
      end
    end
  end
end

require_relative 'ilkbyte/server'
require_relative 'ilkbyte/domain'
require_relative 'ilkbyte/account'