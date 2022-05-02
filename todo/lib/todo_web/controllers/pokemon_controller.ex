defmodule TodoWeb.PokemonController do
  @moduledoc """
    Manages incoming pokemon information
  """
  use TodoWeb, :controller
  @manager Application.get_env(:todo, :pokemon_manager)

  def get_pokemon(conn, %{"pokemon_name" => pokemon_name}) do
    case @manager.get_info(String.downcase(pokemon_name)) do
      {:ok, pokemon} ->
        conn
        |> put_status(200)
        |> render("show.json", pokemon: pokemon)

      {:error, error} ->
        conn
        |> put_status(:not_found)
        |> json(error)
    end
  end
end
