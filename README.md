# Ilkbyte

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ilkbyte`. To experiment with that code, run `bin/console` for an interactive prompt.

Also you can find [API documentation](https://apidocs.ilkbyte.com/docs/1.0/overview) here.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ilkbyte'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ilkbyte
## Configuration

```ruby
access_key = 'Your API Access Key'
secret_key = 'Your API Secret Key'

Ilkbyte::Base.new.setOption(access_key, secret_key)
```
If you don't do this, you'll give **401 not authorized** error.

## Usage

```ruby
require 'ilkbyte'

def myMethod()
    Ilkbyte::Server.new.create
end
```

## Functions Usage
### Account
```ruby
client = Ilkbyte::Account.new
# Retrieve Account
client.account
# List account users
client.accountUsers
```
### Server
```ruby
# Initialize client
client = Ilkbyte::Server.new

# Get available server configurations
client.create

# Create a new server
client.config({
    username: username,
    password: password,
    name: name,
    os_id: os_id,
    app_id: app_id,
    package_id: package_id,
    sshkey: sshkey
})

# List all servers
client.all

# List all active servers
client.active

# Retrieve single server
client.show(server_name)

client.power(server_name, 'shutdown')
client.ip(server_name)
client.ipRdns(server_name, '127.0.0.1', 'test.ni.net.tr')
client.ipLogs(server_name)
client.backup(server_name)
client.backupRestore(server_name, {
  backup_name: 'backup_name'
})
client.snapshot(server_name)
client.snapshotCreate(server_name, {
    name: name
})
client.snapshotRevert(server_name, {
    name: name
})
client.snapshotUpdate(server_name, {
    name: name
})
client.snapshotDelete(server_name, {
    name: name
})
client.snapshotCronAdd(server_name,
  {
    name: name,
    day: day,
    hour: hour,
    min: min
  }
)
client.snapshotCronDelete(server_name, {
    name: name
})
```
### Domain
```ruby
client = Ilkbyte::Domain.new
client.all
client.create(
  {
    server: server_name,
    domain: domain,
    ipv6: ipv6
  }
)
client.show('your-domain-name')
client.add('your-domain-name',
  {
    record_name: record_name,
    record_type: record_type,
    record_content: record_content,
    record_priority: priority
  }
)
client.update('your-domain-name',
  {
    record_id: record_id,
    record_content: record_content,
    record_priority: priority
  }
)
client.delete('your-domain-name')
client.push('your-domain-name')
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ilkbyte.

