defmodule AuctionWeb.ItemView do
  use AuctionWeb, :view

  def integer_to_currency(cents) do
    dollars_and_cents =
      cents
      |> Decimal.div(100)
      |> Decimal.round(2)
      "$#{dollars_and_cents}"
  end

  def render("item.json", %{item: item}) do
    %{
        type: "item",
        id: item.id,
        title: item.title,
        description: item.description,
        ends_at: item.ends_at
    }
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, __MODULE__, "item.json")}
  end

  def render("index.json", %{items: items}) do
    %{data: render_many(items, __MODULE__, "item.json")}
  end
end
