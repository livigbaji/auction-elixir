defmodule AuctionWeb.UserController do
  use AuctionWeb, :controller

  def show(conn, %{"id" => id}) do
    user = Auction.get_user(id)
    render(conn, "user.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    case Auction.insert_user(user_params) do
      {:ok, user} -> render(conn, "stuff.json", user: user)
      {:error, user} -> render(conn, "stuff.json", user: user)
    end
  end
end
