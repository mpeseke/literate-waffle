defmodule Todo.PokemonCacheTest do
  use Todo.DataCase

  alias Todo.PokemonCache

  describe "pokemon_cache" do
    alias Todo.PokemonCache.Pokemon

    import Todo.PokemonCacheFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_pokemon_cache/0 returns all pokemon_cache" do
      pokemon = pokemon_fixture()
      assert PokemonCache.list_pokemon_cache() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert PokemonCache.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Pokemon{} = pokemon} = PokemonCache.create_pokemon(valid_attrs)
      assert pokemon.description == "some description"
      assert pokemon.name == "some name"
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PokemonCache.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Pokemon{} = pokemon} = PokemonCache.update_pokemon(pokemon, update_attrs)
      assert pokemon.description == "some updated description"
      assert pokemon.name == "some updated name"
    end

    test "update_pokemon/2 with invalid data returns error changeset" do
      pokemon = pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = PokemonCache.update_pokemon(pokemon, @invalid_attrs)
      assert pokemon == PokemonCache.get_pokemon!(pokemon.id)
    end

    test "delete_pokemon/1 deletes the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{}} = PokemonCache.delete_pokemon(pokemon)
      assert_raise Ecto.NoResultsError, fn -> PokemonCache.get_pokemon!(pokemon.id) end
    end

    test "change_pokemon/1 returns a pokemon changeset" do
      pokemon = pokemon_fixture()
      assert %Ecto.Changeset{} = PokemonCache.change_pokemon(pokemon)
    end
  end
end
