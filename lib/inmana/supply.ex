defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset
  alias Inmana.Restaurant

  @required_fields [:description, :expiration_date, :responsible, :restaurant_id]

  @external_field [:id] ++ @required_fields

  @derive {Jason.Encoder, only: @external_field}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "supplies" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  @doc false
  def changeset(supply, attrs) do
    supply
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
  end
end
