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
      @server.ip_rdns 'Test', ip: '93.115.79.36', rdns: 'rdns.ilkbyte.com'
    end

    assert_equal @server.success?, true
  end

  # @deprecated old method
  def test_server_ipRdns
    VCR.use_cassette 'server/rdns' do
      @server.ipRdns 'Test', ip: '93.115.79.36', rdns: 'rdns.ilkbyte.com'
    end

    assert_equal @server.success?, true
  end

  def test_server_ip_logs
    VCR.use_cassette 'server/ip_logs' do
      @server.ip_logs 'Test'
    end

    assert_equal @server.success?, true
  end

  def test_server_ipLogs
    VCR.use_cassette 'server/ip_logs' do
      @server.ipLogs 'Test'
    end

    assert_equal @server.success?, true
  end
end
