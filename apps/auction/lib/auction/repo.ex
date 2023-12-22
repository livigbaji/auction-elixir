defmodule Auction.Repo do
  use Ecto.Repo,
      otp_app: :auction,
      adapter: Ecto.Adapters.Postgres
  # alias Auction.Item
end
