module Ilkbyte
  class Account < Base
    def account()
      request("/account")
    end
  end
end