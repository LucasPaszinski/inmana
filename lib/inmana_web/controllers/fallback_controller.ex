defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  def call(conn, {:error, reason}) do
    conn
    |> put_status(400)
    |> text(reason)
  end
end
