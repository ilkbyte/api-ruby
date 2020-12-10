# frozen_string_literal: true

module Ilkbyte
  class Server < BaseResource
    RESOURCE = 'server/'

    def initialize(**args)
      super
    end

    # https://api.ilkbyte.com/server/create
    # Get server configuration parameters
    def create
      request RESOURCE + 'create'
    end

    # https://api.ilkbyte.com/server/create/config
    # Create a new server
    def config(query = {})
      request RESOURCE + 'create/config', query
    end

    # https://api.ilkbyte.com/server/list/all
    # List All Servers
    def all(query = {})
      request RESOURCE + 'list/all', query
    end

    # https://api.ilkbyte.com/server/list
    # List Active Servers
    def active(query = {})
      request RESOURCE + 'list', query
    end

    # https://api.ilkbyte.com/server/manage/:name/show
    # Retrieve a server
    def show(name)
      request RESOURCE + "manage/#{name}/show"
    end

    # https://api.ilkbyte.com/server/manage/:name/power
    # Manage server power status
    # Available parameters :start, :shutdown, :reboot, :destroy
    def power(name, power)
      query = { set: String(power) }
      request RESOURCE + "manage/#{name}/power", query
    end

    # https://api.ilkbyte.com/server/manage/:name/monitor
    # Retrieve server status
    def monitor(name)
      request RESOURCE + "manage/#{name}/monitor"
    end

    # https://api.ilkbyte.com/server/manage/:name/ip/list
    # List a server ip addresses
    def ip_list(name)
      request RESOURCE + "manage/#{name}/ip/list"
    end
    # Old method name is ip
    alias ip ip_list

    # https://api.ilkbyte.com/server/manage/:name/ip/logs
    # Retrieve the server IP logs
    def ip_logs(name)
      request RESOURCE + "manage/#{name}/ip/logs"
    end
    # Old method name is ipLogs
    alias ipLogs ip_logs

    # https://api.ilkbyte.com/server/manage/:name/ip/rdns
    # Update the server any IP address RDNS record
    # @param query { ip: '127.1.1.0', rdns: 'rdns.ilkbyte.com' }
    def ip_rdns(name, query = {})
      request RESOURCE + "manage/#{name}/ip/rdns", query
    end
    # Old method name is ipRdns
    alias ipRdns ip_rdns

    def backup(server_name)
      request("/server/manage/#{server_name}/backup")
    end

    def backupRestore(server_name, query)
      request("/server/manage/#{server_name}/backup/restore", query)
    end

    def snapshot(server_name)
      request("/server/manage/#{server_name}/snapshot")
    end

    def snapshotCreate(server_name, query)
      request("/server/manage/#{server_name}/snapshot/create", query)
    end

    def snapshotRevert(server_name, query)
      request("/server/manage/#{server_name}/snapshot/revert", query)
    end

    def snapshotUpdate(server_name, query)
      request("/server/manage/#{server_name}/snapshot/update", query)
    end

    def snapshotDelete(server_name, query)
      request("/server/manage/#{server_name}/snapshot/delete", query)
    end

    def snapshotCronAdd(server_name, query)
      request("/server/manage/#{server_name}/snapshot/cron/add", query)
    end

    def snapshotCronDelete(server_name, query)
      request("/server/manage/#{server_name}/snapshot/cron/delete", query)
    end
  end
end
