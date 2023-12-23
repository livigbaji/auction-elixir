defmodule AuctionWeb.Authenticator do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    # get Authorization header, decode token
    # if valid get user info
    assign(conn, :current_user, 1)
  end
end
