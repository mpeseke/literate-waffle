defmodule TodoWeb.ItemsController do
  use TodoWeb, :controller

  alias Todo.ItemManager
  alias Todo.ItemCache.Item

  def index(conn, _params) do
    items = ItemManager.list_items()
    changeset = Item.changeset(%Item{}, %{})
    render(conn, "index.html", items: items, changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    ItemManager.create_item(item_params)
    redirect(conn, to: "/items")
  end

  def complete(conn, %{"id" => id}) do
    ItemManager.mark_completed(id)
    redirect(conn, to: "/items")
  end

  def delete(conn, %{"id" => id}) do
    ItemManager.delete_item(id)
    redirect(conn, to: "/items")
  end
end
