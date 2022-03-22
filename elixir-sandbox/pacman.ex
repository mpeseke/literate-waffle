##Pacman Rules Booleans
defmodule Rules do
  def main do
    win?(true, true, true)
  end

  def eat_ghost?(power_pellet, touching_ghost) do
    power_pellet and touching_ghost
  end

  def score?(touch_power_pellet, touch_dot) do
    touch_power_pellet or touch_dot
  end

  def lose?(power_pellet, touching_ghost) do
    power_pellet and touching_ghost
  end

  def win?(all_dots_clear, power_pellet, touching_ghost) do
    all_dots_clear and not lose?(power_pellet, touching_ghost)
  end
end
