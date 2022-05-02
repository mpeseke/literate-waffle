defmodule TodoWeb.PokemonControllerTest do
  import Mox
  use TodoWeb.ConnCase async: true

  @manager Todo.PokemonManagerMock
  @pokemon_name "testName"


  describe "/pokemon" do
    test "return the pokemon object", %{conn: conn} do
      expect(@manager, :get_info, fn @pokemon_name ->
        {:ok, %{
          name: @pokemon_name,
          description: "noOneWillSeeThis"
        }}
      end)

      conn = get(conn,
        Routes.pokemon_path(conn, :get_pokemon, @pokemon_name))

      assert json_response(conn, 200) == %{
        "name" => @pokemon_name,
        "description" => "noOneWillSeeThis"
      }
    end
  end
end
