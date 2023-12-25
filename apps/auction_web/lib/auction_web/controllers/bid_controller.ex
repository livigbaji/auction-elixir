defmodule AuctionWeb.BidController do
  use AuctionWeb, :controller
  # plug :require_logged_in_user

  def create(conn, %{"bid" => bid}) do
    # user_id = conn.assigns.current_user.id
    case Auction.insert_bid(bid) do
      {:ok, bid} -> render(conn, "stuff.json", bid)
      {:error, error} -> render(conn, "stuff.json", error)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Auction.get_item_with_bids(id)
    render(conn, "stuff.json", item: item)
  end
end
