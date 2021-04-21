defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  def call(conn, {:error, status, %Ecto.Changeset{} = changeset})
      when is_integer(status) or is_atom(status) do
    conn
    |> put_status(status)
    |> put_view(InmanaWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, status, reason})
      when is_integer(status) or is_atom(status) do
    conn
    |> put_status(status)
    |> put_view(InmanaWeb.ErrorView)
    |> render("error.json", error: reason)
  end

  def call(conn, {:error, reason}) do
    conn
    |> put_status(400)
    |> put_view(InmanaWeb.ErrorView)
    |> render("error.json", error: reason)
  end
end
