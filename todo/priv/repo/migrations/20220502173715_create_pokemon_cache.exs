defmodule Todo.Repo.Migrations.CreatePokemonCache do
  use Ecto.Migration

  def change do
    create table(:pokemon_cache) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
