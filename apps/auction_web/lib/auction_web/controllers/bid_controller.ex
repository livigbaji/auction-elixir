defmodule AuctionWeb.BidController do
  use AuctionWeb, :controller

  def create(conn, %{"bid" => bid}) do
    case Auction.insert_bid(bid) do
      {:ok, bid} -> render(conn, "stuff.json", bid)
      {:error, error} -> render(conn, "stuff.json", error)
    end
  end
end
