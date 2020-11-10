module Ilkbyte
  class Domain < Base
    def all()
      request("/domain/list")
    end

    def create(domain)
      query = {
        "domain" => domain
      }
      request("/domain/create",query)
    end

    def show(domain)
      request("/domain/manage/#{domain}/show")
    end

    def add(domain,query)
      request("/domain/manage/#{domain}/add",query)
    end

    def update(domain,query)
      request("/domain/manage/#{domain}/uptade",query)
    end

    def delete(domain)
      request("/domain/manage/#{domain}/delete")
    end

    def push(domain)
      request("/domain/manage/#{domain}/push")
    end
  end
end