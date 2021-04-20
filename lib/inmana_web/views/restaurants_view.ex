defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "restaurant created successfully!",
      restaurant: restaurant
    }
  end
end
