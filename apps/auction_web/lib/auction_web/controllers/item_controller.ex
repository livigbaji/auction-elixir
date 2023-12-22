defmodule AuctionWeb.ItemController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.list_items()
    render(conn, "stuff.json", items)
  end

  def show(conn, %{"id" => id}) do
    item = Auction.get_item(id)
    render(conn, "stuff.json", item)
  end

  def create(conn, %{"item" => item_params}) do
    case Auction.insert_item(item_params) do
      {:ok, item} -> render(conn, "stuff.json", item)
      {:error, item} -> render(conn, "stuff.json", item)
    end
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Auction.get_item(id)
    case Auction.update_item(item, item_params) do
      {:ok, item} -> render(conn, "stuff.json", item)
      {:error, item} -> render(conn, "stuff.json", item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Auction.delete_item(%{"id" => id})
    render(conn, "stuff.json", item)
  end
end
