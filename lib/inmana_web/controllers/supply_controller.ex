defmodule InmanaWeb.SupplyController do
  use InmanaWeb, :controller

  import Inmana, only: [create_supply: 1, get_supply: 1]
  alias Inmana.Supply

  # def index(conn, _params) do
  #   supplies = Supplies.list_supplies()
  #   render(conn, "index.json", supplies: supplies)
  # end

  def create(conn, supply_params) do
    with {:ok, %Supply{} = supply} <- create_supply(supply_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.supply_path(conn, :show, supply))
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => id}) do
    with %Supply{} = supply <- get_supply(id) do
      render(conn, "show.json", supply: supply)
    else
      {:error, reason} -> {:error, :not_found, reason}
    end
  end

  # def update(conn, %{"id" => id, "supply" => supply_params}) do
  #   supply = Supplies.get_supply!(id)

  #   with {:ok, %Supply{} = supply} <- Supplies.update_supply(supply, supply_params) do
  #     render(conn, "show.json", supply: supply)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   supply = Supplies.get_supply!(id)

  #   with {:ok, %Supply{}} <- Supplies.delete_supply(supply) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
