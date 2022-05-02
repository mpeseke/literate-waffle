defmodule Todo.ItemCache.Item do

  use Ecto.Schema
  import Ecto.Changeset

  schema "item_cache" do
    field :description, :string
    field :completed, :boolean, default: false
    field :initiative, :integer, default: 0

    timestamps()
  end

  def changeset(item, params) do
    item
    |> cast(params, [:description, :completed, :initiative])
  end
end
