defmodule GuessingGame do

  def main do
    secret_number = number_hider()

    compare(secret_number, 7)
  end

  def compare(secret_number, guess) do
    cond do
      secret_number === guess -> "Correct"
      secret_number < guess -> "Too high"
      secret_number > guess -> "Too low"
      guess === secret_number + 1 or guess === secret_number - 1 -> "So close"
    end

  end

  defp number_hider do
    secret = 7
    secret
  end

end
