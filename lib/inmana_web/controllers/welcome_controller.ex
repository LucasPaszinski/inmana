defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller
  alias Inmana.Welcome

  def welcome(conn, params) do
    with {:ok, msg} <- Welcome.welcome(params) do
      conn
      |> put_status(200)
      |> text(msg)
    end
  end
end
