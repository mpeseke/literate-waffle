defmodule TodoWeb.PokemonViewTest do
  use TodoWeb.ConnCase, async: true
  
  test "renders pokemon" do
    assert render(TodoWeb.PokemonView, "show.json",
      pokemon: %{name: "TestMeView", description: "IDontKnow"}
      ) == %{name: "TestMeView", description: "IDontKnow"
    }
  end


end
