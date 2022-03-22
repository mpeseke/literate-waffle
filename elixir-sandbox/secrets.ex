defmodule Secrets do

  def main do

    ander = Secrets.secret_and(1)
    ander.(2)

  end

  def secret_add(secret) do
    fn input -> input + secret end
  end

  def secret_subtract(secret) do
    fn input -> input - secret end
  end

  def secret_multiply(secret) do
    fn input -> input * secret end
  end

  def secret_divide(secret) do
    fn input -> trunc(input / secret) end
  end

  def secret_and(secret) do
    fn input -> Bitwise.&&&(input, secret) end
  end

  def secret_xor(secret) do
    fn input -> Bitwise.^^^(input, secret) end
  end

  def secret_combine(x, y) do
    fn input -> y.(x.(input)) end
  end


end
