defmodule TodoWeb.PokemonView do
  use TodoWeb, :view

  def render("result.json", %{pokemon: result}) do
    %{
      name: result.name,
      description: result.description
    }
  end

end
