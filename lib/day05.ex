defmodule Day05 do
  @doc """
    iex> Day05.jump({0, {0, 3, 0, 1, -3}})
    {0, {1, 3, 0, 1, -3}}
    iex> Day05.jump({0, {1, 3, 0, 1, -3}})
    {1, {2, 3, 0, 1, -3}}
    iex> Day05.jump({1, {2, 3, 0, 1, -3}})
    {4, {2, 4, 0, 1, -3}}
    iex> Day05.jump({4, {2, 4, 0, 1, -3}})
    {1, {2, 4, 0, 1, -2}}
    iex> Day05.jump({1, {2, 4, 0, 1, -2}})
    {5, {2, 5, 0, 1, -2}}

    iex> Day05.jumpToExit({0, {0, 3, 0, 1, -3}}, 0)
    5

    iex> Day05.stateFromFile("lib/day05-test.txt")
    {0, {0, 3, 0, 1, -3}}
    
    iex> Day05.jumpToExit(Day05.stateFromFile("lib/day05.txt"), 0)
    378980
  """

  def jump({index, jumps}) do
    newIndex = index + elem(jumps, index)
    newJumps = put_elem(jumps, index, elem(jumps, index) + 1)
    {newIndex, newJumps}
  end

  def jumpToExit({index, jumps}, n) do
    {newIndex, newJumps} = jump({index, jumps})
    if (newIndex >= tuple_size(newJumps)) || (newIndex < 0) do
      n+1
    else
      jumpToExit({newIndex, newJumps}, n+1)
    end
  end

  def stateFromFile(filename) do
    {:ok, filetext} = File.read(filename)
    {0, List.to_tuple(Enum.map(String.split(String.trim(filetext), "\n"), fn (s) -> elem(Integer.parse(s), 0) end))}
  end
end

