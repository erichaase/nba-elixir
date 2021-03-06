defmodule NBA.CLI do

  @moduledoc """
  Parses command-line arguments and starts execution
  """

  def run (argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help

  Otherwise it is an espn game id number

  Returns `id_espn` or `:help` if help was given
  """
  def parse_args (argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                                     aliases:  [h:    :help   ])
    case parse do
      { [help: true], _,         _ } -> :help
      { _,            [id_espn], _ } -> String.to_integer(id_espn)
      _                              -> :help
    end
  end

  def process (:help) do
    IO.puts """
    Usage: nba <espn_id>
    """
    System.halt(0)
  end

  def process (id_espn) do
    NBA.BoxScore.fetch(id_espn)
  end
end
