# Ilkbyte

Use this gem integrate Ilkbyte server management process into your app. Ilkbyte APIs including Account, Servers and Domains. 

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
client = Ilkbyte::Client.new(access_key: 'access_key', secret_key: 'secret_key')
```
If you don't do this, you'll give **401 not authorized** error.

## Usage

```ruby
require 'ilkbyte'

client = Ilkbyte::Client.new(access_key: 'access_key', secret_key: 'secret_key')

account_api = client.account
if account_api.success?
  puts account_api.data
end
```

## Functions Usage
### Account
```ruby
# Initialize account form client
account = client.account

# Retrieve Account
# Old name is account will be deprecated on new version
account.retrieve

# List account users
# Old name is accountUsers will be deprecated on new version
account.users

```
### Server
```ruby
# Initialize server from client
servers = client.servers

# Get available server configurations
servers.create

# Create a new server
servers.config username: 'ilkbyteuser', name: 'Test', os_id: 17, package_id: 5, sshkey: 'ssh-rsa'

# List all servers
servers.all

# List all active servers
servers.active

# Retrieve single server
servers.show 'Test'

# Manage server power
servers.power 'Test', :shutdown

# Monitor server status
servers.monitor 'Test'

# IP Management Operations
# ========================
# List server IP list
# Old name is ip will be deprecated on new version
servers.ip_list 'Test'

# Show server IP logs
# Old name is ipLogs will be deprecated on new version
servers.ip_logs 'Test'

# Update Server IP RDN record
# Old name is ipRdns will be deprecated on new version
servers.ip_rdns 'Test', ip: '127.0.0.1', rdns: 'test.ni.net.tr'

# Backup Operations
# ========================
# List server backups
servers.backup 'Test'

# Restore the server backup
# Old name is backupRestore will be deprecated on new version
servers.backup_restore 'Test', 'backup_name'

# Snapshot Operations
# ========================
# List server snapshots
servers.snapshot 'Test'

# Create a new snapshot
# Old name is snapshotCreate will be deprecated on new version
servers.snapshot_create 'Test', 'new_snapshot'

# Import snapshot
# Old name is snapshotRevert will be deprecated on new version
servers.snapshot_revert 'Test', 'old_snapshot'

# Re-create old snapshot
# Old name is snapshotUpdate will be deprecated on new version
servers.snapshot_update 'Test', 'old_snapshot'

# Delete existing snapshot
# Old name is snapshotDelete will be deprecated on new version
servers.snapshot_delete 'Test', 'old_snapshot'

# Create snapshot cronjob
# You have a snapshot
# Old name is snapshotCronAdd will be deprecated on new version
servers.snapshot_cron_add 'Test', name: 'my_snapshot', day: 0, hour: 12, min: 0
  
# Delete existing snapshot cron job
# Old name is snapshotCronDelete will be deprecated on new version
servers.snapshot_cron_delete 'Test', 'my_snapshot'
```
### Domain
```ruby
# Initialize domains form client
domains = client.domains

# List domains
domains.all

# Create a new domain
domains.create domain: 'ilkbyte-api.com', server: 'Test', ipv6: false

# Show domains DNS records
# Old name is show will be deprecated on new version
domains.retrieve 'ilkbyte-api.com'

# Add a new DNS record to domains
domains.add 'ilkbyte-api.com', record_name: 'api', record_type: 'CNAME', record_content: 'ilkbyte-api.com'

# Update domains existing DNS record
domains.update 'ilkbyte-api.com', record_id: 4_068, record_content: 'ilkbyte-dns.com'

# Delete domains exist DNS record 
domains.delete 'ilkbyte-api.com'

# Send DNS updates to the server
domains.push 'ilkbyte-api.com'
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ilkbyte.

