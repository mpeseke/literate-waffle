defmodule Todo.PokemonCache.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemon_cache" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
