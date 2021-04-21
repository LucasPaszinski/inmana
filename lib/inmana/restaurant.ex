defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:name, :email]
  @external_field @required_fields ++ [:id]

  @derive {Jason.Encoder, only: @external_field}

  schema "restaurants" do
    field :name, :string
    field :email, :string
    has_many :supplies, Supply

    timestamps()
  end

  def changeset(%__MODULE__{} = restaurant, attrs) do
    restaurant
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
  end
end
