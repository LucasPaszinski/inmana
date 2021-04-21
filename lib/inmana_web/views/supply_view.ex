defmodule InmanaWeb.SupplyView do
  use InmanaWeb, :view
  alias InmanaWeb.SupplyView

  def render("index.json", %{supplies: supplies}) do
    render_many(supplies, SupplyView, "supply.json")
  end

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply created!",
      supply: render_one(supply, SupplyView, "supply.json")
    }
  end

  def render("show.json", %{supply: supply}) do
    %{supply: render_one(supply, SupplyView, "supply.json")}
  end

  def render("supply.json", %{supply: supply}) do
    supply
  end
end
