# frozen_string_literal: true

module Ilkbyte
  class Account < Base
    def account
      request('/account')
    end

    def accountUsers
      request('/account/users')
    end
  end
end
