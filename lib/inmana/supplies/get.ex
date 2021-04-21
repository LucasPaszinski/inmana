defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  @doc """
  Gets a single supply.

  Raises `Ecto.NoResultsError` if the Supply does not exist.

  ## Examples

      iex> get_supply!(123)
      %Supply{}

      iex> get_supply!(456)
      ** (Ecto.NoResultsError)

  """
  def call(id), do: Repo.get(Supply, id) || {:error, "No Supply with this id was found!"}
end
