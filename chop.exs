defmodule Chop do
  def guesser(n, a..b) when is_integer(n) and n >= a and n <= b and b >= a do
    guess = div(a+b, 2) 
    IO.puts "Is it #{guess}?"
    _compare(n, guess, a..b)
  end

  defp _compare(n, n, _), do: IO.puts "It is #{n}."

  defp _compare(n, guess, a.._b) 
    when guess > n,
    do: guesser(n, a..guess-1)

  defp _compare(n, guess, _a..b) 
    when guess < n,
    do: guesser(n, guess+1..b)
end
