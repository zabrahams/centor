defmodule Centor.Repo.Migrations.AddLinesTable do
  use Ecto.Migration

  def change do
    create table(:lines) do
      add :value,  :string, null: false
      add :source, :string, null: false

      timestamps
    end
  end
end
