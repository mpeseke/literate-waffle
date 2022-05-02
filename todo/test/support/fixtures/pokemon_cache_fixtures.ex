defmodule Todo.PokemonCacheFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.PokemonCache` context.
  """

  @doc """
  Generate a pokemon.
  """
  def pokemon_fixture(attrs \\ %{}) do
    {:ok, pokemon} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Todo.PokemonCache.create_pokemon()

    pokemon
  end
end
