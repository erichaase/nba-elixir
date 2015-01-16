defmodule CLITest do
  use ExUnit.Case

  import NBA.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h",     "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "one value returned if one given" do
    assert parse_args(["400578878"]) == { 400578878 }
  end
end
