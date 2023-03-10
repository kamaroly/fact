defmodule FactWeb.SupplierControllerTest do
  use FactWeb.ConnCase

  import Fact.SuppliersFixtures

  @create_attrs %{address: "some address", email: "some email", mobile_number: "some mobile_number", names: "some names"}
  @update_attrs %{address: "some updated address", email: "some updated email", mobile_number: "some updated mobile_number", names: "some updated names"}
  @invalid_attrs %{address: nil, email: nil, mobile_number: nil, names: nil}

  describe "index" do
    test "lists all suppliers", %{conn: conn} do
      conn = get(conn, Routes.supplier_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Suppliers"
    end
  end

  describe "new supplier" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.supplier_path(conn, :new))
      assert html_response(conn, 200) =~ "New Supplier"
    end
  end

  describe "create supplier" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.supplier_path(conn, :create), supplier: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.supplier_path(conn, :show, id)

      conn = get(conn, Routes.supplier_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Supplier"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.supplier_path(conn, :create), supplier: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Supplier"
    end
  end

  describe "edit supplier" do
    setup [:create_supplier]

    test "renders form for editing chosen supplier", %{conn: conn, supplier: supplier} do
      conn = get(conn, Routes.supplier_path(conn, :edit, supplier))
      assert html_response(conn, 200) =~ "Edit Supplier"
    end
  end

  describe "update supplier" do
    setup [:create_supplier]

    test "redirects when data is valid", %{conn: conn, supplier: supplier} do
      conn = put(conn, Routes.supplier_path(conn, :update, supplier), supplier: @update_attrs)
      assert redirected_to(conn) == Routes.supplier_path(conn, :show, supplier)

      conn = get(conn, Routes.supplier_path(conn, :show, supplier))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, supplier: supplier} do
      conn = put(conn, Routes.supplier_path(conn, :update, supplier), supplier: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Supplier"
    end
  end

  describe "delete supplier" do
    setup [:create_supplier]

    test "deletes chosen supplier", %{conn: conn, supplier: supplier} do
      conn = delete(conn, Routes.supplier_path(conn, :delete, supplier))
      assert redirected_to(conn) == Routes.supplier_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.supplier_path(conn, :show, supplier))
      end
    end
  end

  defp create_supplier(_) do
    supplier = supplier_fixture()
    %{supplier: supplier}
  end
end
