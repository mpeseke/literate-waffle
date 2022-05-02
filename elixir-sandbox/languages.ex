defmodule LanguageList do


  def test do

  end

  def new() do
    new_list = []
    new_list
  end

  def add (list, language) do
    [language | list]
  end

  def remove(list) do
    new_list = tl(list)
    new_list
  end

  def first(list) do n
    hd(list)
  end

  def count(list) do

    Enum.count(list)
  end

  def exciting_list?(list) do

    Enum.member?(list, "Elixir")
  end

end
