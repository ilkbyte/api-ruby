module Ilkbyte
  class Server < Base
    def create()
      request("/server/create")
    end

    def config(query)
      request("/server/create/config",query)
    end

    def all()
      request("/server/list/all")
    end

    def active()
      request("/server/list")
    end

    def show(server_name)
      request("/server/manage/#{server_name}/show")
    end

    def power(server_name,power)
      query = {"set" => power}
      request("/server/manage/#{server_name}/power",query)
    end

    def monitor(server_name)
      request("/server/manage/#{server_name}/monitor")
    end

    def ipRdns(server_name,ip,rdns)
      query = [
        "ip" => ip,
        "rdns" => rdns
      ]
      request("/server/manage/#{server_name}/ip/rdns",query)
    end

    def ip(server_name)
      request("/server/manage/#{server_name}/ip/list")
    end

    def ipLogs(server_name)
      request("/server/manage/#{server_name}/ip/logs")
    end
  end   
end