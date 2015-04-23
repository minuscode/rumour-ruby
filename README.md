# Rumour

Rumour is a Ruby wrapper to communicate with Rumour REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rumour-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rumour-ruby

## Requirements

To communicate with Rumour REST API you will need a Rumour account.

## Usage

First, initialize a client:
```ruby
access_token = 'your_rumour_access_token'

rumour = Rumour::Client.new(access_token)
```

Then, send a text message:
```ruby
from = '+15005550006'
recipient = '+15005550005'

rumour.send_text_message(from, recipient, 'Hello from Rumour!')
#=> {'id' => '1', 'from' => '+15005550006', 'recipient' => '+15005550005', ... }
```

Or an Android Push Notification:
```ruby
recipient = 'Device-Token-Here'

rumour.send_push_notification('android', recipient, data: { ... })
```

Or even an iOS Push Notification:
```ruby
recipient = 'Device-Token-Here'

rumour.send_push_notification('ios', recipient, alert: { ... })
```

## Contributing

1. Fork it ( https://github.com/joaodiogocosta/rumour-ruby/fork ) 
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
