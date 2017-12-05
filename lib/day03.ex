defmodule Day03 do
  @doc """

  ## Examples

      iex> Day03.ring(1)
      0
      iex> Day03.ring(2)
      1
      iex> Day03.ring(9)
      1
      iex> Day03.ring(10)
      2
      iex> Day03.ring(25)
      2
      iex> Day03.ring(26)
      3

      iex> Day03.offsetInSide(12, 2)
      1
      iex> Day03.offsetInSide(23, 2)
      2
      iex> Day03.offsetInSide(26, 3)
      5
      iex> Day03.offsetInSide(27, 3)
      4

      iex> Day03.offsetFromCenterOfSide(4, 2)
      0
      iex> Day03.offsetFromCenterOfSide(4, 3)
      1
      iex> Day03.offsetFromCenterOfSide(4, 1)
      1
      iex> Day03.offsetFromCenterOfSide(6, 2)
      1
      iex> Day03.offsetFromCenterOfSide(6, 5)
      2
      
      iex> Day03.dist(1)
      0
      iex> Day03.dist(12)
      3
      iex> Day03.dist(23)
      2
      iex> Day03.dist(24)
      3
      iex> Day03.dist(25)
      4
      iex> Day03.dist(26)
      5
      iex> Day03.dist(1024)
      31
      iex> Day03.dist(325489)
      552
  """

  import Math

  def ring(n, r \\ 0) do
    if Math.pow(r*2+1, 2) >= n do
      r
    else
      ring(n, r+1)
    end
  end

  def offsetInSide(n, r), do: rem(round((r*2+1)*(r*2+1)) - n, r*2)

  def offsetFromCenterOfSide(sideLength, offsetInSide), do: round(abs(sideLength/2 - offsetInSide))

  def dist(1), do: 0
  def dist(n) do
    ring = ring(n)
    offsetFromCenterOfSide = offsetFromCenterOfSide(ring*2, offsetInSide(n, ring))
    dist = ring + offsetFromCenterOfSide
    IO.puts("N: #{n} yields #{ring} + #{offsetFromCenterOfSide} = #{dist}")
    dist
  end
end
