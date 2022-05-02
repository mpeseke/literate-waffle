defmodule Todo.PokemonManager do
  @moduledoc """
    Organizes pokemon information upon retrieval
  """
  alias Todo.PokemonCache

  @api Application.get_env(:todo, :pokemon_api)

  @callback get_info(name :: String.t()) :: {:ok, any} | {:error, any}

  def get_info(pokemon_name) do
    case PokemonCache.get_pokemon_by_name(pokemon_name) do
      nil ->
        pokemon_name
        |> retrieve_info()
        |> handle_retrieval()

      pokemon ->
        {:ok, %{name: pokemon.name, description: pokemon.description}}
    end
  end

  defp retrieve_info(pokemon_name) do
    with {:ok, %{name: name, id: id, abilities: _abilities}} <-
            @api.get_pokemon(pokemon_name),
          {:ok, characteristics} <-
            @api.get_description(id),
          {:ok, species} <-
            @api.get_species(id),
          {:ok, color} <-
            @api.get_color(id) do
              {:ok,
            %{
              name: name,
              description: characteristics,
              species: species,
              color: color
            }}
    else
      {:error, error} ->
        {:error, error}

    _ ->
        {:error, "undefined_error"}
    end
  end

  defp handle_retrieval({:ok, %{name: _name, description: _description} = pokemon}) do
    case PokemonCache.create_pokemon(pokemon) do
      {:error, _} = error -> error
      {:ok, pokemon} -> {:ok, %{name: pokemon.name, description: pokemon.description}}
    end
  end

  defp handle_retrieval({:error, _} = error), do: error

end
