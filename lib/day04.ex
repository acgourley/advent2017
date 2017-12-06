defmodule Day04 do
  @doc """

  ## Examples

    iex> Day04.isValid(["foo", "bar", "baz"])
    1
    iex> Day04.isValid(["foo", "bar", "baz", "foo"])
    0
    iex> Day04.validInFile("lib/day04.txt", &Day04.isValid/1)
    325
    iex> Day04.isValid2(["foo", "bar", "baz"])
    1
    iex> Day04.isValid2(["foo", "bar", "baz", "ofo"])
    0
    iex> Day04.validInFile("lib/day04.txt", &Day04.isValid2/1)
    119
  """
  
  def validInFile(filename, validator) do
    {:ok, filetext} = File.read(filename)
    lines = String.split(filetext, "\n")
    Enum.sum(Enum.map(lines, fn(line) -> validator.(String.split(line, " ")) end))
  end

  def isValid(words) do
    if length(Enum.uniq(words)) == length(words), do: 1, else: 0
  end
  def isValid2(words) do
    sortedWords = Enum.map(words, fn(word) -> Enum.sort(String.split(word, "")) end)
    if length(Enum.uniq(sortedWords)) == length(sortedWords), do: 1, else: 0
  end
end

