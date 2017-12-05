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
      

      iex> Day03.ringToCorner(1)
      9
      iex> Day03.ringToCorner(2)
      25
      iex> Day03.ringToCorner(3)
      49

      iex> Day03.offsetInRing(2, 1)
      7
      iex> Day03.offsetInRing(3, 1)
      6
      iex> Day03.offsetInRing(12, 2)
      13


      iex> Day03.sideLengthForRing(2)
      4
      iex> Day03.sideLengthForRing(3)
      6

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

  def ring(1)
    do 0  
  end
  def ring(n, r \\ 0) do

    if Math.pow(ringToBase(r), 2) >= n do
      r
    else
      ring(n, r+1)
    end
  end

  def ringToBase(r) do
    r*2+1
  end

  def ringToCorner(r) do
    round(Math.pow(ringToBase(r), 2))
  end

  def offsetInRing(n, r) do
    ringToCorner(ring(n, r)) - n
  end

  def sideLengthForRing(r) do
    r*2
  end

  def offsetInSide(n, r) do
    rem(offsetInRing(n, r), sideLengthForRing(r))
  end

  def offsetFromCenterOfSide(sideLength, offsetInSide) do
    round(abs(sideLength/2 - offsetInSide))
  end

  def dist(1) 
    do 0
  end

  def dist(n) do
    ring = ring(n)
    sideLength = sideLengthForRing(ring)
    offsetInSide = offsetInSide(n, ring)
    sideLength = sideLengthForRing(ring)
    offsetFromCenterOfSide = offsetFromCenterOfSide(sideLength, offsetInSide)
    dist = ring + offsetFromCenterOfSide
    IO.puts("N: #{n} yields #{ring} + #{offsetFromCenterOfSide} = #{dist}")
    dist
  end
end
