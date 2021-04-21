defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Inmana.{Restaurants, Supplies}

  defdelegate create_restaurant(attrs), to: Restaurants.Create, as: :call
  defdelegate create_supply(attrs), to: Supplies.Create, as: :call
  defdelegate get_supply(attrs), to: Supplies.Get, as: :call
end
