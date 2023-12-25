defmodule AuctionWeb.ItemChannel do
  use AuctionWeb, :channel

  def join("item:" <> _item_id, _params, socket) do
    {:ok, socket}
  end
end
