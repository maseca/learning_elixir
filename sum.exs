defmodule Sum do
  def tail_recursion(list), do: _summer(hd(list), tl(list))
  defp _summer(acc, []), do: acc
  defp _summer(acc, tail), do: _summer(acc + hd(tail), tl(tail))

  def reduction(list), do: Enum.reduce(list, fn x, acc -> x + acc end)
end
