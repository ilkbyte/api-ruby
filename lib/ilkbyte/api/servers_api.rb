# frozen_string_literal: true

module Ilkbyte
  class ServersApi < BaseApi
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
      request RESOURCE + "manage/#{name}/power", set: String(power)
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

    # https://api.ilkbyte.com/server/manage/:name/backup
    # List server backups
    def backup(name)
      request RESOURCE + "manage/#{name}/backup"
    end

    # https://api.ilkbyte.com/server/manage/:name/backup/restore
    # Restore the backup
    def backup_restore(name, backup_name)
      request RESOURCE + "manage/#{name}/backup/restore", backup_name: backup_name
    end
    # Old method name is backupRestore
    alias backupRestore backup_restore

    # https://api.ilkbyte.com/server/manage/:name/snapshot
    # List the server snapshots
    def snapshot(name)
      request RESOURCE + "manage/#{name}/snapshot"
    end

    # https://api.ilkbyte.com/server/manage/:name/snapshot/create
    # Create a new snapshot
    def snapshot_create(name, snapshot_name)
      request RESOURCE + "manage/#{name}/snapshot/create", name: snapshot_name
    end
    # Old method name is snapshotCreate
    alias snapshotCreate snapshot_create

    # https://api.ilkbyte.com/server/manage/:name/snapshot/revert
    # Rollback server from snapshot
    def snapshot_revert(name, snapshot_name)
      request RESOURCE + "manage/#{name}/snapshot/revert", name: snapshot_name
    end
    # Old method name is snapshotRevert
    alias snapshotRevert snapshot_revert

    # https://api.ilkbyte.com/server/manage/:name/snapshot/update
    # Re-create the snapshot
    def snapshot_update(name, snapshot_name)
      request RESOURCE + "manage/#{name}/snapshot/update", name: snapshot_name
    end
    # Old method name is snapshotUpdate
    alias snapshotUpdate snapshot_update

    # https://api.ilkbyte.com/server/manage/:name/snapshot/delete
    # Delete the snapshot
    def snapshot_delete(name, snapshot_name)
      request RESOURCE + "manage/#{name}/snapshot/delete", name: snapshot_name
    end
    # Old method name is snapshotDelete
    alias snapshotDelete snapshot_delete

    # https://api.ilkbyte.com/server/manage/:name/snapshot/cron/add
    # Create new snapshot cron job for the server
    def snapshot_cron_add(name, query = {})
      request RESOURCE + "manage/#{name}/snapshot/cron/add", query
    end
    # Old method name is snapshotDelete
    alias snapshotCronAdd snapshot_cron_add

    # https://api.ilkbyte.com/server/manage/:name/snapshot/cron/delete
    # Delete the snapshot cron job
    def snapshot_cron_delete(name, snapshot_job_name)
      request RESOURCE + "manage/#{name}/snapshot/cron/delete", name: snapshot_job_name
    end
    # Old method name is snapshotCronDelete
    alias snapshotCronDelete snapshot_cron_delete
  end
end
