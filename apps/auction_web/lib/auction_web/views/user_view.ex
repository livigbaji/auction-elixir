defmodule AuctionWeb.UserView do
  use AuctionWeb, :view

  def render("user.json", %{user: user}) do
    %{
      data: %{
        name: "User",
        id: user.id,
        username: user.username,
        email: user.email_address
      }
    }
  end
end
