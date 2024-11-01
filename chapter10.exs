defmodule Chapter10 do
  def all?([], _), do: true
  def all?([ head | tail ], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _), do: nil
  def each([ head, tail ], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _), do: []
  def filter([ head, tail ], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  def split(list, n) when n >= 0, do: split_([], list, n)
  defp split_(list_a, list_b, 0), do: {list_a, list_b}
  defp split_(list_a, [], _),     do: {list_a, []}
  defp split_(list_a, [ head, tail ], n) do 
    split_(list_a ++ head, tail, n - 1)
  end

  def take(_, 0),    do: []
  def take([], _),   do: []
  def take([ head, tail ], n) when n > 0 do
    [ head | take(tail, n - 1) ]
  end
end
