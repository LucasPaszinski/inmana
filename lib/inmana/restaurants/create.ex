defmodule Inmana.Restaurants.Create do
  alias Inmana.{Repo, Restaurant}

  def call(attrs) do
    %Restaurant{}
    |> Restaurant.changeset(attrs)
    |> Repo.insert()
  end
end
