# frozen_string_literal: true

module Ilkbyte
  class Server < Base
    def create
      request('/server/create')
    end

    def config(query)
      request('/server/create/config', query)
    end

    def all
      request('/server/list/all')
    end

    def active
      request('/server/list')
    end

    def show(server_name)
      request("/server/manage/#{server_name}/show")
    end

    def power(server_name, power)
      query = { 'set' => power }
      request("/server/manage/#{server_name}/power", query)
    end

    def monitor(server_name)
      request("/server/manage/#{server_name}/monitor")
    end

    def ipRdns(server_name, ip, rdns)
      query = [
        'ip' => ip,
        'rdns' => rdns
      ]
      request("/server/manage/#{server_name}/ip/rdns", query)
    end

    def ip(server_name)
      request("/server/manage/#{server_name}/ip/list")
    end

    def ipLogs(server_name)
      request("/server/manage/#{server_name}/ip/logs")
    end

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
