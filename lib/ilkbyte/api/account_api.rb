# frozen_string_literal: true

module Ilkbyte
  class AccountApi < BaseApi
    RESOURCE = 'account'

    def initialize(**args)
      super
    end

    # https://api.ilkbyte.com/account
    # Retrieve account
    def retrieve
      request RESOURCE
    end

    # https://api.ilkbyte.com/account/users
    # List account users
    def users
      request RESOURCE + '/users'
    end
  end
end
