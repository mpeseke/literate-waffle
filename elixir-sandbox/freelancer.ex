defmodule FreelancerRates do

  def main do
    days_in_budget(20000, 80, 11.0)
  end

  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    percent_conversion = discount * 0.01
    dollar_discount = before_discount * percent_conversion
    before_discount - dollar_discount
  end

  def monthly_rate(hourly_rate, discount) do
    gross_rate = 22 * daily_rate(hourly_rate)
    trunc(Float.ceil(apply_discount(gross_rate, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    day_base_pay = daily_rate(hourly_rate)
    discount_day_pay = apply_discount(day_base_pay, discount)

    Float.floor(budget / discount_day_pay, 1)
  end
end
