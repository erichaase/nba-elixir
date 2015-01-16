defmodule NBA.CLI do

  @moduledoc """
  Parses command-line arguments and starts execution
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv` can be -h or --help, which returns :help

  Otherwise it is an espn game id number

  Return a tuple of `{ id_espn }`, or `:help` if help was given
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                                     aliases:  [h:    :help   ])
    case parse do
      { [help: true], _,         _ } -> :help
      { _,            [id_espn], _ } -> { String.to_integer(id_espn) }
      _                              -> :help
    end
  end
end
