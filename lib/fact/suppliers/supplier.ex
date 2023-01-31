defmodule Fact.Suppliers.Supplier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suppliers" do
    field :address, :string
    field :email, :string
    field :mobile_number, :string
    field :names, :string

    timestamps()
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, [:names, :email, :mobile_number, :address])
    |> validate_required([:names, :email, :mobile_number, :address])
  end
end
