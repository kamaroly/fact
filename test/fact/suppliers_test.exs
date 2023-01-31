defmodule Fact.SuppliersTest do
  use Fact.DataCase

  alias Fact.Suppliers

  describe "suppliers" do
    alias Fact.Suppliers.Supplier

    import Fact.SuppliersFixtures

    @invalid_attrs %{address: nil, email: nil, mobile_number: nil, names: nil}

    test "list_suppliers/0 returns all suppliers" do
      supplier = supplier_fixture()
      assert Suppliers.list_suppliers() == [supplier]
    end

    test "get_supplier!/1 returns the supplier with given id" do
      supplier = supplier_fixture()
      assert Suppliers.get_supplier!(supplier.id) == supplier
    end

    test "create_supplier/1 with valid data creates a supplier" do
      valid_attrs = %{address: "some address", email: "some email", mobile_number: "some mobile_number", names: "some names"}

      assert {:ok, %Supplier{} = supplier} = Suppliers.create_supplier(valid_attrs)
      assert supplier.address == "some address"
      assert supplier.email == "some email"
      assert supplier.mobile_number == "some mobile_number"
      assert supplier.names == "some names"
    end

    test "create_supplier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Suppliers.create_supplier(@invalid_attrs)
    end

    test "update_supplier/2 with valid data updates the supplier" do
      supplier = supplier_fixture()
      update_attrs = %{address: "some updated address", email: "some updated email", mobile_number: "some updated mobile_number", names: "some updated names"}

      assert {:ok, %Supplier{} = supplier} = Suppliers.update_supplier(supplier, update_attrs)
      assert supplier.address == "some updated address"
      assert supplier.email == "some updated email"
      assert supplier.mobile_number == "some updated mobile_number"
      assert supplier.names == "some updated names"
    end

    test "update_supplier/2 with invalid data returns error changeset" do
      supplier = supplier_fixture()
      assert {:error, %Ecto.Changeset{}} = Suppliers.update_supplier(supplier, @invalid_attrs)
      assert supplier == Suppliers.get_supplier!(supplier.id)
    end

    test "delete_supplier/1 deletes the supplier" do
      supplier = supplier_fixture()
      assert {:ok, %Supplier{}} = Suppliers.delete_supplier(supplier)
      assert_raise Ecto.NoResultsError, fn -> Suppliers.get_supplier!(supplier.id) end
    end

    test "change_supplier/1 returns a supplier changeset" do
      supplier = supplier_fixture()
      assert %Ecto.Changeset{} = Suppliers.change_supplier(supplier)
    end
  end
end
