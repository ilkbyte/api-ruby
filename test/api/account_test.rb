# frozen_string_literal: true

require 'test_helper'

class AccountTest < TestBase
  def setup
    client = Ilkbyte::Client.new(access_key: 'access_key', secret_key: 'secret_key')
    @account = client.account
  end

  def test_account_retrieve
    VCR.use_cassette 'account/retrieve' do
      @account.retrieve
    end

    assert_equal @account.success?, true
  end

  def test_account_list_users
    VCR.use_cassette 'account/users' do
      @account.users
    end

    assert_equal @account.success?, true
  end
end