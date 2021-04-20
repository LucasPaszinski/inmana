defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller
  alias Inmana.Restaurants

  def create(conn, params) do
    with {:ok, restaurant} <- create_restaurant(params) do
      conn
      |> put_status(200)
      |> render("create.json", restaurant: restaurant)
    else
      {:error, changeset} -> {:error, 422, changeset}
    end
  end
end
