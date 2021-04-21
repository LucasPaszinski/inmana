defmodule Inmana.SuppliesTest do
  use Inmana.DataCase

  alias Inmana.Supplies

  describe "supplies" do
    alias Inmana.Supply

    @valid_attrs %{
      description: "some description",
      expiration_date: ~D[2010-04-17],
      responsible: "some responsible"
    }
    @update_attrs %{
      description: "some updated description",
      expiration_date: ~D[2011-05-18],
      responsible: "some updated responsible"
    }
    @invalid_attrs %{description: nil, expiration_date: nil, responsible: nil}

    def supply_fixture(attrs \\ %{}) do
      {:ok, supply} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Supplies.create_supply()

      supply
    end

    test "list_supplies/0 returns all supplies" do
      supply = supply_fixture()
      assert Supplies.list_supplies() == [supply]
    end

    test "get_supply!/1 returns the supply with given id" do
      supply = supply_fixture()
      assert Supplies.get_supply!(supply.id) == supply
    end

    test "create_supply/1 with valid data creates a supply" do
      assert {:ok, %Supply{} = supply} = Supplies.create_supply(@valid_attrs)
      assert supply.description == "some description"
      assert supply.expiration_date == ~D[2010-04-17]
      assert supply.responsible == "some responsible"
    end

    test "create_supply/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Supplies.create_supply(@invalid_attrs)
    end

    test "update_supply/2 with valid data updates the supply" do
      supply = supply_fixture()
      assert {:ok, %Supply{} = supply} = Supplies.update_supply(supply, @update_attrs)
      assert supply.description == "some updated description"
      assert supply.expiration_date == ~D[2011-05-18]
      assert supply.responsible == "some updated responsible"
    end

    test "update_supply/2 with invalid data returns error changeset" do
      supply = supply_fixture()
      assert {:error, %Ecto.Changeset{}} = Supplies.update_supply(supply, @invalid_attrs)
      assert supply == Supplies.get_supply!(supply.id)
    end

    test "delete_supply/1 deletes the supply" do
      supply = supply_fixture()
      assert {:ok, %Supply{}} = Supplies.delete_supply(supply)
      assert_raise Ecto.NoResultsError, fn -> Supplies.get_supply!(supply.id) end
    end

    test "change_supply/1 returns a supply changeset" do
      supply = supply_fixture()
      assert %Ecto.Changeset{} = Supplies.change_supply(supply)
    end
  end
end
