defmodule Inmana.Supplies.Create do
  @moduledoc """
  The Create Supplies context.
  """

  alias Inmana.{Repo, Supply}

  @doc """
  Creates a supply.

  ## Examples

      iex> call(%{field: value})
      {:ok, %Supply{}}

      iex> call(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def call(attrs \\ %{}) do
    %Supply{}
    |> Supply.changeset(attrs)
    |> Repo.insert()
  end
end
