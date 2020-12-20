# frozen_string_literal: true

module Ilkbyte
  class DomainsApi < BaseApi
    RESOURCE = 'domain/'

    def initialize(**args)
      super
    end

    # https://api.ilkbyte.com/domain/list
    # List domains
    def all
      request RESOURCE + 'list'
    end

    # https://api.ilkbyte.com/domain/create
    # Create a new domain
    def create(query = {})
      request RESOURCE + 'create', query
    end

    # https://api.ilkbyte.com/domain/manage/:domain_name/show
    # Retrieve the Domain DNS Records
    def retrieve(domain)
      request RESOURCE + "manage/#{domain}/show"
    end
    alias show retrieve

    # https://api.ilkbyte.com/domain/manage/:domain_name/add
    # Add a DNS record the domain
    def add(domain, query = {})
      request RESOURCE + "manage/#{domain}/add", query
    end

    # https://api.ilkbyte.com/domain/manage/:domain_name/update
    # Update the domain DNS records
    def update(domain, query)
      request RESOURCE + "manage/#{domain}/update", query
    end

    # https://api.ilkbyte.com/domain/manage/:domain_name/delete
    # Delete the domain DNS record
    def delete(domain, query = {})
      request RESOURCE + "manage/#{domain}/delete", query
    end

    # https://api.ilkbyte.com/domain/manage/:domain_name/push
    # Send DNS record updated to server
    def push(domain)
      request RESOURCE + "manage/#{domain}/push"
    end
  end
end
