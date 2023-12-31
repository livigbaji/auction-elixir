defmodule Auction do
  alias Auction.{Repo, Item, User, Password, Bid}
  import Ecto.Query

  @repo Repo

  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end

  def insert_item(attrs) do
    Item
    |> struct(attrs)
    |> @repo.insert()
  end

  def delete_item(%Item{} = item), do: @repo.delete(item)

  def update_item(%Auction.Item{} = item, updates) do
    item
    |> Item.changeset(updates)
    |> @repo.update()
  end

  def get_user(id), do: @repo.get!(User, id)

  def new_user, do: User.changeset_with_password(%User{})

  def insert_user(params) do
    %User{}
    |> User.changeset_with_password(params)
    |> @repo.insert
  end

  def get_user_by_username_and_password(username, password) do
    with user when not is_nil(user) <- @repo.get_by(User, %{username: username}),
      true <- Password.verify_with_hash(password, user.hashed_password) do user
    else
      _ -> Password.dummy_verify
    end
  end

  def insert_bid(params) do
    %Bid{}
    |> Bid.changeset(params)
    |> @repo.insert()
  end

  def get_item_with_bids(id) do
    id
    |> get_item()
    |> @repo.preload(bids: [:user])
  end

  def get_bids_for_user(user) do
    query =
      from b in Bid,
      where: b.user_id == ^user.id,
      order_by: [desc: :inserted_at],
      preload: :item,
      limit: 10
    @repo.all(query)
  end

  # TODO only allow bids that have a higher amount than the current high bid
  # TODO Don't allolw bids on items after the item's ends_at date and time have passed
  # TODO Only allow the creation of an item if a user is logged in
  # TODO Associate newly created items with the logged in user
  # TODO Try making more complex database queries using the Ecto.Query module
  # TODO Display the bid datetime in the user's time zone (it's currently in UTC)
end
