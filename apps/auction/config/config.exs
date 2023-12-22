import Config

config :auction, ecto_repos: [Auction.Repo]

config :auction, Auction.Repo,
       database: "starkdb",
       username: "ironman",
       password: "nonewhatsoever",
       hostname: "localhost",
       port: "5431"
