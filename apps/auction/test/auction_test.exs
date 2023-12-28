defmodule AuctionTest do
  alias Auction.{Repo}
  use ExUnit.Case
  doctest Auction

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "the truth" do
    assert true
  end
end
