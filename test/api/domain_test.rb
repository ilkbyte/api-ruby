# frozen_string_literal: true

require 'test_helper'

class DomainTest < TestBase
  def setup
    client = Ilkbyte::Client.new(access_key: 'access_key', secret_key: 'secret_key')
    @domains = client.domains
  end

  def test_domain_list
    VCR.use_cassette 'domain/all' do
      @domains.all
    end

    assert_equal @domains.success?, true
  end

  def test_domain_create
    VCR.use_cassette 'domain/create' do
      @domains.create(domain: 'ilkbyte-api.com',
                      server: 'ilkbyteApiServer',
                      ipv6: false)
    end

    assert_equal @domains.success?, true
  end

  def test_domain_retrieve
    VCR.use_cassette 'domain/retrieve' do
      @domains.retrieve 'ilkbyte.com'
    end

    assert_equal @domains.success?, true
  end

  # @deprecated method
  def test_domain_show
    VCR.use_cassette 'domain/retrieve' do
      @domains.show 'ilkbyte.com'
    end

    assert_equal @domains.success?, true
  end

  def test_domain_add_dns_record
    VCR.use_cassette 'domain/add' do
      @domains.add('ilkbyte.com',
                   record_name: 'api',
                   record_type: 'CNAME',
                   record_content: 'ilkbyte.com')
    end

    assert_equal @domains.success?, true
  end

  def test_domain_update_dns_record
    VCR.use_cassette 'domain/update' do
      @domains.update('ilkbyte.com',
                      record_id: 4_068,
                      record_content: 'ilkbyte-dns.com')
    end

    assert_equal @domains.success?, true
  end

  def test_domain_delete_dns_record
    VCR.use_cassette 'domain/delete' do
      @domains.delete('ilkbyte.com',
                      record_id: 4_068)
    end

    assert_equal @domains.success?, true
  end

  def test_domain_push_dns_records
    VCR.use_cassette 'domain/push' do
      @domains.push 'ilkbyte.com'
    end

    assert_equal @domains.success?, true
  end
end
