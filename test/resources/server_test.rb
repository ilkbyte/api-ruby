# frozen_string_literal: true

require 'test_helper'

class ServerTest < TestBase
  def setup
    @server = Ilkbyte::Server.new(access_key: 'access_key', secret_key: 'secret_key')
  end

  def test_server_create
    VCR.use_cassette 'server/create' do
      @server.create
    end

    assert_equal @server.success?, true
  end

  def test_server_config
    VCR.use_cassette 'server/config' do
      @server.config(
        username: 'ilkbyteuser',
        name: 'Test',
        os_id: 17,
        package_id: 5,
        sshkey: 'ssh-rsa'
      )
    end

    assert_equal @server.success?, true
  end

  def test_list_all_servers
    VCR.use_cassette 'server/all' do
      @server.all
    end

    assert_equal @server.success?, true
  end

  def test_list_active_servers
    VCR.use_cassette 'server/active' do
      @server.active
    end

    assert_equal @server.success?, true
  end

  def test_server_power
    VCR.use_cassette 'server/power' do
      @server.power 'Test', :shutdown
    end

    assert_equal @server.success?, true
  end

  def test_server_monitor
    VCR.use_cassette 'server/monitor' do
      @server.monitor 'Test'
    end

    assert_equal @server.success?, true
  end

  def test_server_ip_list
    VCR.use_cassette 'server/ip_list' do
      @server.ip_list 'Test'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_ip
    VCR.use_cassette 'server/ip_list' do
      @server.ip 'Test'
    end

    assert_equal @server.success?, true
  end

  def test_server_ip_rdns
    VCR.use_cassette 'server/rdns' do
      @server.ip_rdns 'Test', ip: '127.0.0.1', rdns: 'rdns.ilkbyte.com'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_ipRdns
    VCR.use_cassette 'server/rdns' do
      @server.ipRdns 'Test', ip: '127.0.0.1', rdns: 'rdns.ilkbyte.com'
    end

    assert_equal @server.success?, true
  end

  def test_server_ip_logs
    VCR.use_cassette 'server/ip_logs' do
      @server.ip_logs 'Test'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_ipLogs
    VCR.use_cassette 'server/ip_logs' do
      @server.ipLogs 'Test'
    end

    assert_equal @server.success?, true
  end

  def test_server_backup
    VCR.use_cassette 'server/backup' do
      @server.backup 'Test'
    end

    assert_equal @server.success?, true
  end

  def test_server_backup_restore
    VCR.use_cassette 'server/backup_restore' do
      @server.backup_restore 'Test', 'Weekly'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_backupRestore
    VCR.use_cassette 'server/backup_restore' do
      @server.backup_restore 'Test', 'Weekly'
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshot_list
    VCR.use_cassette 'server/snapshot' do
      @server.snapshot 'ilkbyteApiServer'
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshot_create
    VCR.use_cassette 'server/snapshot_create' do
      @server.snapshot_create 'ilkbyteApiServer', 'test'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_snapshotCreate
    VCR.use_cassette 'server/snapshot_create' do
      @server.snapshotCreate 'ilkbyteApiServer', 'test'
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshot_revert
    VCR.use_cassette 'server/snapshot_revert' do
      @server.snapshot_revert 'ilkbyteApiServer', 'test'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_snapshotRevert
    VCR.use_cassette 'server/snapshot_revert' do
      @server.snapshotRevert 'ilkbyteApiServer', 'test'
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshot_update
    VCR.use_cassette 'server/snapshot_update' do
      @server.snapshot_update 'Test', 'test'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_snapshotUpdate
    VCR.use_cassette 'server/snapshot_update' do
      @server.snapshotUpdate 'Test', 'test'
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshot_delete
    VCR.use_cassette 'server/snapshot_delete' do
      @server.snapshot_delete 'Test', 'test'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_snapshotDelete
    VCR.use_cassette 'server/snapshot_delete' do
      @server.snapshotDelete 'Test', 'test'
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshot_cron_add
    VCR.use_cassette 'server/snapshot_cron_add' do
      @server.snapshot_cron_add 'Test', name: 'test', day: 0, hour: 12, min: 0
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_snapshotCronAdd
    VCR.use_cassette 'server/snapshot_cron_add' do
      @server.snapshotCronAdd 'Test', name: 'test', day: 0, hour: 12, min: 0
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshot_cron_delete
    VCR.use_cassette 'server/snapshot_cron_delete' do
      @server.snapshot_cron_delete 'Test', 'test'
    end

    assert_equal @server.success?, true
  end

  def test_server_snapshotCronDelete
    VCR.use_cassette 'server/snapshot_cron_delete' do
      @server.snapshotCronDelete 'Test', 'test'
    end

    assert_equal @server.success?, true
  end
end
