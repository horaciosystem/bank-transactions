defmodule BalanceTest do
  use ExUnit.Case

  test "the truth" do
    Balance.write_to_file(22.47)
    assert File.read("./ballance.dat") == {:ok, "22.47"}
  end
end
