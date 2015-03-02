<h1 align="center">Perseus (Son of Zeus)</h1>
<p align="center">
  <img src='http://fc06.deviantart.net/fs11/i/2006/209/5/4/Vatican_Statues_3____Perseus_by_ProxyDave.png' />
</p>


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
# => Perseus::Summoner
client.summoner
-- client.summoner.by_name(name) # Perseus::Summoner
-- client.summoner.get(summoner_id) # Perseus::Summoner
-- client.summoner.masteries(summoner_id) # [Perseus::Masterypage]
-- client.summoner.runes(summoner_id) # [Perseus::Runepage]

# => Perseus::TeamRequest
client.team
-- client.team.get(summoner_id) # Array

# => Perseus::ChampionRequest
client.champion
-- client.champion.get # Perseus::Champion

# => Perseus::StatsRequest
client.stats
-- client.stats.ranked(summoner_id) # Perseus::RankedStats
-- client.stats.summary(summoner_id) # Perseus::SummaryStats

# => Perseus::StaticRequest
client.static
-- client.static.champion # Perseus::StaticRequest (for endpoint /static-data/champion)
-- client.static.champion.get # [OpenStruct]
-- client.static.champion.get(id) # OpenStruct 
-- client.static.champion.get(champData: 'all') # You can also pass query parameters
```

**NOTE:** The realm endpoint is not implemented.