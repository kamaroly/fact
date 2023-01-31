defmodule Fact.Repo.Migrations.CreateSuppliers do
  use Ecto.Migration

  def change do
    create table(:suppliers) do
      add :names, :string
      add :email, :string
      add :mobile_number, :string
      add :address, :string

      timestamps(default: fragment("NOW()") )
    end
  end
end
