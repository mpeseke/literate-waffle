defmodule M do
  def main do
    expected_minutes_in_oven()
  end

  def expected_minutes_in_oven do
    oven_time = 40
    IO.puts "Integer #{is_integer(oven_time)}"
    oven_time
  end

  def remaining_minutes_in_oven(x) do
    expected_minutes_in_oven() - x
  end

  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  def total_time_in_minutes(layers, time_in_oven) do
    remaining_minutes_in_oven(time_in_oven) + preparation_time_in_minutes(layers)
  end

  def alarm do
    "Ding!"
  end

  def do_stuff do
    my_str = "This is my first string"
    IO.puts "Lenght : #{String.length(my_str)}"
  end


  def data_stuff do
    my_int = 123
    IO.puts "Is #{my_int} an Integer? #{is_integer(my_int)}"
    my_float = 3.14159
    IO.puts "Is #{my_float} a Float? #{is_float(my_float)}"
  end

  # def name_prompt do
  #   name = IO.gets("What is your name? ") |> String.trim()
  #   IO.puts "Hello #{name}"
  # end
end
