defmodule KitchenCalculator do

  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, num}), do: {:milliliter, num * 240}
  def to_milliliter({:fluid_ounce, num}), do: {:milliliter, num * 30}
  def to_milliliter({:teaspoon, num}), do: {:milliliter, num * 5}
  def to_milliliter({:tablespoon, number}), do {:milliliter, num * 15}
  def to_milliliter(volume_pair), do volume_pair

  def from_milliliter(volume_pair, :cup), do {:cup, elem(volume_pair, 1) / 240}





end
