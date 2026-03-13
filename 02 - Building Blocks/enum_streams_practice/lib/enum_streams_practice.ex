defmodule EnumStreamsPractice do
  # A function that returns a stream of file lines with the trailing newline removed.
  @spec filterd_lines!(String.t()) :: Enumerable.t()
  def filterd_lines!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
  end

  # A helper that gets the length of a line, but returns 0 for empty lines.
  @spec line_length(String.t()) :: non_neg_integer()
  def line_length(line) do
    line
    |> String.trim()
    |> String.length()
  end

  # A lines_lengths!/1 that takes a file path and returns a list of numbers, with each number representing the length of the corresponding line from the file.
  @spec lines_lengths!(String.t()) :: [non_neg_integer()]
  def lines_lengths!(path) do
    path
    |> filterd_lines!()
    |> Enum.map(&line_length/1)
  end

  # A longest_line_length!/1 that returns the length of the longest line in a file.
  @spec longest_line_length!(String.t()) :: non_neg_integer()
  def longest_line_length!(path) do
    path
    |> filterd_lines!()
    |> Enum.map(&line_length/1)
    |> Enum.max()
  end

  # A longest_line!/1 that returns the contents of the longest line in a file.
  @spec longest_line!(String.t()) :: String.t()
  def longest_line!(path) do
    path
    |> filterd_lines!()
    |> Enum.max_by(&line_length/1)
  end
end
