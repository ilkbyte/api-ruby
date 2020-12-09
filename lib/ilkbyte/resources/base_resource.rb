# frozen_string_literal: true

module Ilkbyte
  class BaseResource
    BASE_URL = 'https://api.ilkbyte.com/'

    attr_reader :access_key, :secret_key, :query

    def initialize(**args)
      @access_key = args[:access_key]
      @secret_key = args[:secret_key]

      if @access_key.nil? || @secret_key.nil?
        raise ArgumentError, 'Ilkbyte::BaseResource Argument Error'
      end

      @query = { access: @access_key, secret: @secret_key }
    end

    def request(path, query = nil)
      request_url = BASE_URL + path

      response = Faraday.get(request_url, query)
      JSON.parse response.body
    end
  end
end
