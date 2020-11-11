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
AccessKey = "Your Api Access Key"
SecretKey = "Your Api Secret Key"
Ilkbyte::Base.new.setOption(AccessKey,SecretKey)
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
### Server
```ruby
Ilkbyte::Server.new.create
Ilkbyte::Server.new.config({
    "username" => @username,
    "password" => @password,
    "name"     => @name,
    "os_id"    => @os_id,
    "app_id"   => @app_id,
    "package_id" => @package_id,
    "sshkey" => @sshkey
})
Ilkbyte::Server.new.all
Ilkbyte::Server.new.active
Ilkbyte::Server.new.show(server_name)
Ilkbyte::Server.new.power(server_name,"shutdown")
Ilkbyte::Server.new.ip(server_name)
Ilkbyte::Server.new.ipRdns(server_name, "127.0.0.1", "test.ni.net.tr")
Ilkbyte::Server.new.ipLogs(server_name)
```
### Domain
```ruby
Ilkbyte::Domain.new.all
Ilkbyte::Domain.new.create({
    "server" => @server_name,
    "domain" => @domain,
    "ipv6" => ipv6
    })
Ilkbyte::Domain.new.show("your-domain-name")
Ilkbyte::Domain.new.add("your-domain-name",{
    "record_name" => @record_name,
    "record_type" => @record_type,
    "record_content" => @record_content,
    "record_priority" => @priority
})
Ilkbyte::Domain.new.update("your-domain-name",{
    "record_id" => @record_id,
    "record_content" => @record_content,
    "record_priority" => @priority
})
Ilkbyte::Domain.new.delete("your-domain-name")
Ilkbyte::Domain.new.push("your-domain-name")
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ilkbyte.

