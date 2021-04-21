defmodule Inmana.Repo.Migrations.CreateSupplies do
  use Ecto.Migration

  def change do
    create table(:supplies) do
      add :description, :text
      add :expiration_date, :date
      add :responsible, :string
      add :restaurant_id, references(:restaurants, on_delete: :nothing)

      timestamps()
    end

    create index(:supplies, [:restaurant_id])
  end
end
