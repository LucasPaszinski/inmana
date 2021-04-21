defmodule Inmana.Supplies.GetByExpirationDate do
  alias Inmana.{Repo, Supply}
  import Ecto.Query

  def call(date \\ Date.utc_today()) do
    end_week = Date.end_of_week(date)

    from(supply in Supply,
      where:
        supply.expiration_date >= ^date and
          supply.expiration_date <= ^end_week,
      preload: [:restaurant]
    )
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %{email: email}} -> email end)
  end
end
