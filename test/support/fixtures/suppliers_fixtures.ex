defmodule Fact.SuppliersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fact.Suppliers` context.
  """

  @doc """
  Generate a supplier.
  """
  def supplier_fixture(attrs \\ %{}) do
    {:ok, supplier} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        mobile_number: "some mobile_number",
        names: "some names"
      })
      |> Fact.Suppliers.create_supplier()

    supplier
  end
end
