# Perseus (Son of Zeus)

> In Greek mythology, Perseus (/ˈpɜrsiəs, -sjuːs/; Greek: Περσεύς), the legendary founder of Mycenae and of the Perseid dynasty of Danaans, was the first hero. His exploits in defeating various archaic monsters provided the founding myths of the Twelve Olympians. Perseus beheaded the Gorgon Medusa and saved Andromeda from the sea monster Cetus. Perseus was the son of the mortal Danaë and the god Zeus.

Why are you telling me this?! No idea, but now, you're a lil bit smarter then before.

### Installation

Add this line to your application's Gemfile:

    gem 'perseus-io'
    
And then execute:

    $ bundle
Or install it yourself as:

    $ gem install perseus-io
    
### Usage

```ruby
require 'perseus'

client = Perseus::Client.new "my_api_key", {region: "eune"}
# => <Perseus::Client:0x000000020c0b28 @api_key="my_api_key", @region="eune">
```

### Rate Limit
Will have to add custom logic on how to handle Rate Limit Hits. Have in mind, the Rate limits are:

    500 request(s) every 10 minute(s)
    10 request(s) every 10 second(s)

### Available Requests

```ruby
client.summoner
# => Perseus::SummonerRequest

client.stats
# => Perseus::StatsRequest

client.match
# => Perseus::MatchRequest
```