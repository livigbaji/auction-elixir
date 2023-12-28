use Mix.Config

config :auction, Auction.Repo,
       database: "starkdb",
       username: "ironman",
       password: "nonewhatsoever",
       hostname: "localhost",
       port: "5431",
       pool: Ecto.Adapters.SQL.Sandbox
