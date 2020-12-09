# frozen_string_literal: true

module Ilkbyte
  class BaseResource
    BASE_URL = 'https://api.ilkbyte.com/'

    attr_reader :access_key, :secret_key, :query, :status_code

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

      response = Faraday.get(request_url, @query)
      @status_code = response.status
      JSON.parse response.body
    end

    # returns true if status_code is between 200-300
    def success?
      status_code >= 200 && status_code < 300
    end

    # returns true if status_code is between 400-600
    def error?
      status_code >= 400 && status_code < 600
    end
  end
end
