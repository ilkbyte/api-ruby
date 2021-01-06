# frozen_string_literal: true

module Ilkbyte
  class Client
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    # Access to Account API
    def account
      @account ||= AccountApi.new params
    end

    # Access to Domains API
    def domains
      @domains ||= DomainsApi.new params
    end

    # Access to Servers API
    def servers
      @servers ||= ServersApi.new params
    end
  end
end
