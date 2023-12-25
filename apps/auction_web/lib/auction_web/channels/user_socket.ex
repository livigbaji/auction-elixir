defmodule AuctionWeb.UserSocket do
  use Phoenix.Socket

  channel "item:*", AuctionWeb.ItemChannel
end
