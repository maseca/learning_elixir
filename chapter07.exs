defmodule Chapter7 do
  def map([], _func),             do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def reduce([], acc, _func),             do: acc
  def reduce([ head | tail ], acc, func), do: reduce(tail, func.(head, acc), func)

  def sum([ head | tail ]), do: reduce(tail, head, &(&1 + &2))

  def mapsum(list, func), do: map(list, func) |> sum

  def max([ head | tail ]), do: reduce(tail, head, &max_of_2/2)

  def max_of_2(a, b) when a == b, do: a
  def max_of_2(a, b) when a > b,  do: a
  def max_of_2(a, b) when b > a,  do: b

  def caesar([], _),              do: []
  def caesar([ head | tail ], n), do: [ _caesarer(n, head) | caesar(tail, n) ]

  @lowercase 97..122
  @num_chars Range.size(@lowercase)
  defp _caesarer(n, char) when n + char in @lowercase, do: n + char
  defp _caesarer(n, char),                             do: _caesarer(n - @num_chars, char)

  def span_r(a, b) when a == b, do: [a]
  def span_r(a, b) when a < b,  do: _spanner(a, [b])

  defp _spanner(a, list = [ head | _ ]) when head > a,  do: _spanner(a, [ head - 1 | list ])
  defp _spanner(a, list = [ head | _ ]) when head == a, do: list

  def span(a, b) when a > b, do: []
  def span(a, b), do: [ a | span(a + 1, b) ]
end
