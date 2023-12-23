defmodule AuctionWeb.SessionController do
  use AuctionWeb, :controller

  def create(conn, %{"user" => %{"username" => username, "password" => password}}) do
    case Auction.get_user_by_username_and_password(username, password) do
      %Auction.User{} = user -> render(conn, "stuff.json", user: user)
      _ -> render(conn, "stuff.json")
    end
  end

  def delete(conn, _params) do
    # later
  end
end
